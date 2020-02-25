# == Schema Information
#
# Table name: bookings
#
#  id          :integer          not null, primary key
#  time        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  doctor_id   :integer
#  hospital_id :integer
#  patient_id  :integer
#
# Indexes
#
#  index_bookings_on_doctor_id    (doctor_id)
#  index_bookings_on_hospital_id  (hospital_id)
#  index_bookings_on_patient_id   (patient_id)
#
# Foreign Keys
#
#  doctor_id    (doctor_id => doctors.id)
#  hospital_id  (hospital_id => hospitals.id)
#  patient_id   (patient_id => patients.id)
#
class Patient::V1::Booking < ApplicationRecord
  include Relations::Booking

  validates :hospital, presence: true
  validates :doctor, presence: true
  validates :time, presence: true
end
