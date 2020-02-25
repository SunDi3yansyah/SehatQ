require "rails_helper"

RSpec.describe Patient::V1::DoctorsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient/v1/doctors').to route_to(controller: 'patient/v1/doctors', action: 'index', format: 'json')
    end

    it 'routes to #show' do
      expect(:get => '/patient/v1/doctors/1').to route_to(controller: 'patient/v1/doctors', action: 'show', id: '1', format: 'json')
    end
  end
end
