require 'rails_helper'

RSpec.describe 'Patient::V1::Bookings', type: :request do

  let(:valid_headers) { patient_valid_headers_without_jwt }
  let(:invalid_headers) { patient_invalid_headers }

  let!(:bookings) { create_list(:patient_v1_booking, 3) }
  let(:booking) { bookings.first }

  describe 'GET /patient/v1/bookings' do
    context 'with valid routes' do
      before { get patient_v1_bookings_path, headers: valid_headers }

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

  describe 'GET /patient/v1/bookings/:id' do
    context 'with valid routes' do
      before { get patient_v1_booking_path(booking), headers: valid_headers }

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
      before { get patient_v1_booking_path('wrong'), headers: valid_headers }

      it 'return 200 response' do
        expect(response).to have_http_status(404)
      end

      it 'return message `Not Found`' do
        expect(json['response']['message']).to include('Not Found')
        expect(json['data']['message']).to include('Not Found')
      end
    end
  end

  describe 'POST /patient/v1/bookings' do
    let(:patient) { create(:patient_v1_patient) }

    let(:valid_headers) { patient_valid_headers }

    let(:hospital) { create(:patient_v1_hospital) }
    let(:doctor) { create(:patient_v1_doctor) }
    let(:valid_attributes) do
      {
        booking: {
          hospital_id: hospital.id,
          doctor_id: doctor.id,
          time: Time.now + 3.hours
        }
      }.to_json
    end
    let(:invalid_attributes) do
      {
        patient_address: {
          hospital_id: nil,
          doctor_id: nil,
          time: nil
        }
      }.to_json
    end

    context 'and invalid params' do
      before { post patient_v1_bookings_path, params: invalid_attributes, headers: valid_headers }

      it 'return 422 response' do
        expect(response).to have_http_status(422)
      end

      it 'return message `Unprocessable Entity`' do
        expect(json['response']['message']).to include('Unprocessable Entity')
      end
    end

    context 'and valid params' do
      before { post patient_v1_bookings_path, params: valid_attributes, headers: valid_headers }

      it 'return 201 response' do
        expect(response).to have_http_status(201)
      end

      it 'return message `Created`' do
        expect(json['response']['message']).to include('Created')
      end

      it 'body content from data not to be empty' do
        expect(json['data']).not_to be_empty
      end
    end
  end

end
