require 'rails_helper'

RSpec.describe Patient::V1::PatientsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient/v1/patients').to route_to(controller: 'patient/v1/patients', action: 'index', format: 'json')
    end

    it 'routes to #show' do
      expect(:get => '/patient/v1/patients/1').to route_to(controller: 'patient/v1/patients', action: 'show', id: '1', format: 'json')
    end
  end
end
