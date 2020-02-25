require 'rails_helper'

RSpec.describe "Patient::V1::Hospitals", type: :request do

  let(:valid_headers) { patient_valid_headers_without_jwt }
  let(:invalid_headers) { patient_invalid_headers }

  let!(:hospitals) { create_list(:patient_v1_hospital, 3) }
  let(:hospital) { hospitals.first }

  describe 'GET /patient/v1/hospitals' do
    context 'with valid routes' do
      before { get patient_v1_hospitals_path, headers: valid_headers }

      it 'return 200 response' do
        expect(response).to have_http_status(200)
      end

      it 'return message `OK`' do
        expect(json['response']['message']).to include('OK')
      end

      it 'body content from data not to be empty' do
        expect(json['data']).not_to be_empty
      end
    end
  end

  describe 'GET /patient/v1/hospitals/:id' do
    context 'with valid routes' do
      before { get patient_v1_hospital_path(hospital), headers: valid_headers }

      it 'return 200 response' do
        expect(response).to have_http_status(200)
      end

      it 'return message `OK`' do
        expect(json['response']['message']).to include('OK')
      end

      it 'body content from data not to be empty' do
        expect(json['data']).not_to be_empty
      end
    end

    context 'with not found' do
      before { get patient_v1_hospital_path('wrong'), headers: valid_headers }

      it 'return 200 response' do
        expect(response).to have_http_status(404)
      end

      it 'return message `Not Found`' do
        expect(json['response']['message']).to include('Not Found')
        expect(json['data']['message']).to include('Not Found')
      end
    end
  end

end
