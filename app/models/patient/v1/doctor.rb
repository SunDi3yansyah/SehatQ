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
class Patient::V1::Doctor < ApplicationRecord
  include Relations::Doctor
end
