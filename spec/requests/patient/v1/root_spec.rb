require 'rails_helper'

RSpec.describe 'Patient::V1::Root', type: :request do

  let(:patient) { create(:patient_v1_patient) }
  let(:valid_headers) { patient_valid_headers }
  let(:invalid_headers) { patient_invalid_headers }

  describe 'GET /patient/v1' do
    context 'with valid routes' do
      before { get patient_v1_root_path, headers: valid_headers }

      it 'return http 200' do
        expect(response).to have_http_status(200)
      end

      it 'return a valid response value for the `message` key' do
        expect(json['response']['message']).to include('OK')
      end

      it 'return a valid response value for the `app_name` key' do
        expect(json['data']['initializers']['app_name']).to include(APP_NAME)
      end
    end
  end

end
