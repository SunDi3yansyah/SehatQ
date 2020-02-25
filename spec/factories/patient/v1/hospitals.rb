# == Schema Information
#
# Table name: hospitals
#
#  id         :integer          not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :patient_v1_hospital, class: 'Patient::V1::Hospital' do
    name { Faker::Company.name }
    address { Faker::Address.full_address }
  end
end
