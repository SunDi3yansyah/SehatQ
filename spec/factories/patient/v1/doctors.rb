# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :patient_v1_doctor, class: 'Patient::V1::Doctor' do
    name { 'Dr. ' + (Faker::Name.first_name + ' ' + Faker::Name.last_name).gsub(/[^a-zA-Z0-9.\s]/, '') }
    email { Faker::Internet.unique.free_email }
    phone { Faker::Number.leading_zero_number(digits: 12) }
  end
end
