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
require 'rails_helper'

RSpec.describe Patient::V1::Doctor, type: :model do
  describe 'Associations' do
    it { should have_many(:schedules) }
    it { should have_many(:bookings) }
  end
end
