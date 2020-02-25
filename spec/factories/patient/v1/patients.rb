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
FactoryBot.define do
  factory :patient_v1_patient, class: 'Patient::V1::Patient' do
    name { (Faker::Name.first_name + ' ' + Faker::Name.last_name).gsub(/[^a-zA-Z0-9.\s]/, '') }
    email { Faker::Internet.unique.free_email }
    phone { Faker::Number.leading_zero_number(digits: 12) }
    password { 'secure' }
    active { true }
  end
end
