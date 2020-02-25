module Patient::ApplicationConcern
  extend ActiveSupport::Concern

  included do
    include Patient::AuthenticateJwt
    helper_method :patient, :patient_id
  end

  private
  # @return [Object]
  def patient
    Patient::V1::Patient.find_by(id: payload['patient_id'], active: true)
  rescue
    nil
  end

  # @return [Object]
  def patient_id
    patient.nil? ? nil : patient.id
  end
end
