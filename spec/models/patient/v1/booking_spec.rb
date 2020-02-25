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
require 'rails_helper'

RSpec.describe Patient::V1::Booking, type: :model do
  describe 'Associations' do
    it { should belong_to(:hospital) }
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
  end

  describe 'Validate' do
    it { should validate_presence_of(:hospital) }
    it { should validate_presence_of(:doctor) }
    it { should validate_presence_of(:time) }
  end
end
