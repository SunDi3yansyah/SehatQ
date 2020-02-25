# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  day         :string
#  time        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  doctor_id   :integer
#  hospital_id :integer
#
# Indexes
#
#  index_schedules_on_doctor_id    (doctor_id)
#  index_schedules_on_hospital_id  (hospital_id)
#
# Foreign Keys
#
#  doctor_id    (doctor_id => doctors.id)
#  hospital_id  (hospital_id => hospitals.id)
#
FactoryBot.define do
  factory :patient_v1_schedule, class: 'Patient::V1::Schedule' do
    association :hospital, factory: :patient_v1_hospital
    association :doctor, factory: :patient_v1_doctor
    day { (Time.now + 1.days).strftime('%A') }
    time { (Time.now + 1.days).strftime('%H:%M') }
  end
end
