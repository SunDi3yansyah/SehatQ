require 'rails_helper'

RSpec.describe Patient::V1::RootController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient/v1').to route_to(controller: 'patient/v1/root', action: 'index', format: 'json')
    end
  end
end
