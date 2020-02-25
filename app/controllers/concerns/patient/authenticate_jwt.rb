module Patient::AuthenticateJwt
  extend ActiveSupport::Concern

  included do
    require 'json_web_token'
  end

  private
  # @return [Object]
  def authenticate_jwt
    if !payload || !JsonWebToken.valid_payload(payload)
      return api({ message: http_status_codes(401), failure: 'Access Token' }, 401)
    end

    current_patient!

    return api({ message: http_status_codes(401), failure: 'Access Token' }, 401) unless @current_patient

    if Patient::V1::PatientToken.find_by(token: request_token)
      @current_patient
    else
      return api({ message: http_status_codes(401), failure: 'Access Token' }, 401)
    end
  end

  # @return [FalseClass, TrueClass]
  def have_correct_token?
    if !payload || !JsonWebToken.valid_payload(payload)
      false
    else
      true
    end
  end

  # @return [Object]
  def request_token
    request.headers['X-AUTH-TOKEN'].split(' ').last
  end

  # @return [Object]
  def payload
    JsonWebToken.decode(request_token).first
  rescue
    nil
  end

  # @return [Object]
  def current_patient!
    @current_patient = Patient::V1::Patient.find_by(id: payload['patient_id'], active: true)
  end
end
