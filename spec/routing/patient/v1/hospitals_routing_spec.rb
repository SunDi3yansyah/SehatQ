require "rails_helper"

RSpec.describe Patient::V1::HospitalsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient/v1/hospitals').to route_to(controller: 'patient/v1/hospitals', action: 'index', format: 'json')
    end

    it 'routes to #show' do
      expect(:get => '/patient/v1/hospitals/1').to route_to(controller: 'patient/v1/hospitals', action: 'show', id: '1', format: 'json')
    end
  end
end
