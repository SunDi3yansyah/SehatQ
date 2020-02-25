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
  factory :patient_v1_account_sign_in, class: 'Patient::V1::Account::SignIn' do
    
  end
end
