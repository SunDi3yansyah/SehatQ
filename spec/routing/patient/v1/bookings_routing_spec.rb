require "rails_helper"

RSpec.describe Patient::V1::BookingsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/patient/v1/bookings').to route_to(controller: 'patient/v1/bookings', action: 'index', format: 'json')
    end

    it 'routes to #show' do
      expect(:get => '/patient/v1/bookings/1').to route_to(controller: 'patient/v1/bookings', action: 'show', id: '1', format: 'json')
    end

    it 'routes to #create' do
      expect(:post => '/patient/v1/bookings').to route_to(controller: 'patient/v1/bookings', action: 'create', format: 'json')
    end
  end
end
