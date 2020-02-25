module Relations::Patient
  extend ActiveSupport::Concern

  included do
    has_many :patient_tokens, foreign_key: 'patient_id'
    has_many :bookings, foreign_key: 'patient_id'

    has_secure_password
  end
end
