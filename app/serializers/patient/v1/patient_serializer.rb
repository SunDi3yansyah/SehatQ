# == Schema Information
#
# Table name: patients
#
#  id              :integer          not null, primary key
#  active          :boolean
#  email           :string
#  name            :string
#  password_digest :string
#  phone           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Patient::V1::PatientSerializer < ApplicationSerializer
  attributes :id, :name, :email, :phone, :password_digest, :active

  # has_many :patient_tokens
  # has_many :bookings
end
