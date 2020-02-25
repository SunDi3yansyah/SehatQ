# == Schema Information
#
# Table name: patient_tokens
#
#  id         :integer          not null, primary key
#  token      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  patient_id :integer
#
# Indexes
#
#  index_patient_tokens_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  patient_id  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Patient::V1::PatientToken, type: :model do
  describe 'Associations' do
    it { should belong_to(:patient) }
  end
end
