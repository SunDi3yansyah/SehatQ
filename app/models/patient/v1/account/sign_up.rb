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
class Patient::V1::Account::SignUp < ApplicationRecord
  self.table_name = 'patients'

  include Relations::Patient

  validates :email, presence: true
  validates_email_format_of :email, message: I18n.t('errors.messages.invalid'), check_mx: true, mx_message: 'Unknown email provider'
  validates :name, presence: true
  validates :phone, presence: true

  before_create :set_active
  before_create :set_email

  private
  def set_active
    self.active = true
  end

  def set_email
    self.email = self.email.to_s.downcase.strip.delete(" ")
  end
end
