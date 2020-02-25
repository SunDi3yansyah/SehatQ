class Patient::V1::Account::SignInController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      return api({ message: I18n.t(:account_you_are_signed_in) }, 422) unless patient_id.nil?

      patient = Patient::V1::Account::SignIn.find_by(email: sign_in_params[:identity]) ||
        Patient::V1::Account::SignIn.find_by(phone: sign_in_params[:identity])

      return api({ message: I18n.t(:account_identity_does_not_exist) }, 422) unless patient.present?

      return api({ message: I18n.t(:account_password_cant_be_blank) }, 422) unless sign_in_params[:password].present?

      return api({ message: I18n.t(:account_password_does_not_exist) }, 422) unless patient.password_digest.present?

      return api({ message: I18n.t(:account_password_is_invalid) }, 422) unless patient.authenticate(sign_in_params[:password]).present?

      if patient.active?
        token = JsonWebToken.encode( { patient_id: patient.id })

        patient.patient_tokens.find_or_create_by!(token: token)

        api({
              message: I18n.t(:account_successfully_logged_in),
              token: token,
              expired_at: {
                format_integer: JsonWebToken.decode(token).first["exp"],
                format_datetime: Time.at(JsonWebToken.decode(token).first["exp"])
              }
            })
      else
        api({ message: I18n.t(:account_has_not_been_verified) }, 200)
      end
    end
  end

  private
  def sign_in_params
    params.require(:sign_in).permit(:identity, :password)
  end
end
