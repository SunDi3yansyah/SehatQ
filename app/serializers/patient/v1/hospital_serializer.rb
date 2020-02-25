# == Schema Information
#
# Table name: hospitals
#
#  id         :integer          not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Patient::V1::HospitalSerializer < ApplicationSerializer
  attributes :id, :name, :address

  # has_many :bookings
  # has_many :schedules
end
