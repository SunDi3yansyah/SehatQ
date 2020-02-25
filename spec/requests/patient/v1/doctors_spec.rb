require 'rails_helper'

RSpec.describe 'Patient::V1::Doctors', type: :request do

  let(:valid_headers) { patient_valid_headers_without_jwt }
  let(:invalid_headers) { patient_invalid_headers }

  let!(:doctors) { create_list(:patient_v1_doctor, 3) }
  let(:doctor) { doctors.first }

  describe 'GET /patient/v1/doctors' do
    context 'with valid routes' do
      before { get patient_v1_doctors_path, headers: valid_headers }

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

  describe 'GET /patient/v1/doctors/:id' do
    context 'with valid routes' do
      before { get patient_v1_doctor_path(doctor), headers: valid_headers }

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
      before { get patient_v1_doctor_path('wrong'), headers: valid_headers }

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
