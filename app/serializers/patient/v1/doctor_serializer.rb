# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Patient::V1::DoctorSerializer < ApplicationSerializer
  attributes :id, :name, :email, :phone

  # has_many :schedules
  # has_many :bookings
end
