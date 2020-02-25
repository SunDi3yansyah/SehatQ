module Relations::Schedule
  extend ActiveSupport::Concern

  included do
    belongs_to :hospital
    belongs_to :doctor
  end
end
