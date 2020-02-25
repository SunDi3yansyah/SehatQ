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

RSpec.describe Patient::V1::Account::SignIn, type: :model do
end
