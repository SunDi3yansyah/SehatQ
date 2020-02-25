require 'rails_helper'

RSpec.describe Patient::RootController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient').to route_to(controller: 'patient/root', action: 'index', format: 'json')
    end
  end
end
