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
FactoryBot.define do
  factory :patient_v1_patient_token, class: 'Patient::V1::PatientToken' do
    association :patient, factory: :patient_v1_patient
    token { SecureRandom.urlsafe_base64(64) }
  end
end
