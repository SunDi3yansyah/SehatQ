module Relations::Booking
  extend ActiveSupport::Concern

  included do
    belongs_to :hospital
    belongs_to :doctor
    belongs_to :patient
  end
end
