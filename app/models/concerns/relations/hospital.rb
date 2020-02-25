module Relations::Hospital
  extend ActiveSupport::Concern

  included do
    has_many :bookings
    has_many :schedules
  end
end
