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
require 'rails_helper'

RSpec.describe Patient::V1::Patient, type: :model do
  describe 'Associations' do
    it { should have_many(:patient_tokens).with_foreign_key('patient_id') }
    it { should have_many(:bookings).with_foreign_key('patient_id') }
  end
end
