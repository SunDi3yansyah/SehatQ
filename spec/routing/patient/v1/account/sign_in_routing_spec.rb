require 'rails_helper'

RSpec.describe Patient::V1::Account::SignInController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(:post => '/patient/v1/account/sign-in').to route_to(controller: 'patient/v1/account/sign_in', action: 'create', format: 'json')
    end
  end
end
