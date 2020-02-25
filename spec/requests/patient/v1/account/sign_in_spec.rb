require 'rails_helper'

RSpec.describe 'Patient::V1::Account::SignIn', type: :request do

  let(:patient) { create(:patient_v1_patient) }
  let(:valid_headers) { pvhwj }
  let(:invalid_headers) { patient_invalid_headers }
  let(:valid_attributes) do
    {
      sign_in: {
        identity: patient.email,
        password: patient.password
      }
    }.to_json
  end
  let(:invalid_attributes) do
    {
      sign_in: {
        identity: Faker::Internet.unique.free_email,
        password: nil
      }
    }.to_json
  end

  describe 'POST /patient/v1/account/sign-in' do

    context 'and invalid params' do
      before { post patient_v1_account_sign_in_path, params: invalid_attributes, headers: valid_headers }

      it 'return 422 response' do
        expect(response).to have_http_status(422)
      end

      it 'return message `Unprocessable Entity`' do
        expect(json['response']['message']).to include('Unprocessable Entity')
      end
    end

    context 'and valid params' do
      before { post patient_v1_account_sign_in_path, params: valid_attributes, headers: valid_headers }

      it 'return 200 response' do
        expect(response).to have_http_status(200)
      end

      it 'return message `OK`' do
        expect(json['response']['message']).to include('OK')
      end

      it 'return an token' do
        expect(json['data']['token']).not_to be_nil
      end
    end

  end

end
