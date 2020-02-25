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
class Patient::V1::ScheduleSerializer < ApplicationSerializer
  attributes :id, :day, :time

  belongs_to :hospital
  belongs_to :doctor
end
