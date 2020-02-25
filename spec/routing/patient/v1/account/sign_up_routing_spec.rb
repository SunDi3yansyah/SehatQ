require 'rails_helper'

RSpec.describe Patient::V1::Account::SignUpController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(:post => '/patient/v1/account/sign-up').to route_to(controller: 'patient/v1/account/sign_up', action: 'create', format: 'json')
    end
  end
end
