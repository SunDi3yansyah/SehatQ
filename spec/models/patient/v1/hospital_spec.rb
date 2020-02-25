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
require 'rails_helper'

RSpec.describe Patient::V1::Hospital, type: :model do
  describe 'Associations' do
    it { should have_many(:bookings) }
    it { should have_many(:schedules) }
  end
end
