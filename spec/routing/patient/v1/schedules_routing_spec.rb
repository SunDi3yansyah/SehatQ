require "rails_helper"

RSpec.describe Patient::V1::SchedulesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient/v1/schedules').to route_to(controller: 'patient/v1/schedules', action: 'index', format: 'json')
    end

    it 'routes to #show' do
      expect(:get => '/patient/v1/schedules/1').to route_to(controller: 'patient/v1/schedules', action: 'show', id: '1', format: 'json')
    end
  end
end
