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
FactoryBot.define do
  factory :patient_v1_booking, class: 'Patient::V1::Booking' do
    association :hospital, factory: :patient_v1_hospital
    association :doctor, factory: :patient_v1_doctor
    association :patient, factory: :patient_v1_patient
    time { Time.now + 3.hours }
  end
end
