class Patient::V1::Account::SignUpController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      not_actived = Patient::V1::Account::Patient.find_by(
        email: sign_up_params[:email].to_s.downcase.strip.delete(' '),
        active: false
      )

      return api({ message: I18n.t(:account_has_not_been_verified) }, 422) if not_actived.present?

      patient = Patient::V1::Account::SignUp.new(sign_up_params)

      if patient.save
        api({ message: I18n.t(:account_was_created_successfully) }, 201)
      else
        api({ message: patient.errors.full_messages.first }, 422)
      end
    end
  end

  private
  def sign_up_params
    params.require(:sign_up).permit(
      :name,
      :email,
      :phone,
      :password,
      :password_confirmation
    )
  end
end
