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
require 'rails_helper'

RSpec.describe Patient::V1::Schedule, type: :model do
  describe 'Associations' do
    it { should belong_to(:hospital) }
    it { should belong_to(:doctor) }
  end
end
