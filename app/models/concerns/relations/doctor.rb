module Relations::Doctor
  extend ActiveSupport::Concern

  included do
    has_many :schedules
    has_many :bookings
  end
end
