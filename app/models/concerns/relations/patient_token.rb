module Relations::PatientToken
  extend ActiveSupport::Concern

  included do
    belongs_to :patient
  end
end
