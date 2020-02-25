require 'rails_helper'

RSpec.describe 'Patient::V1::Account::SignUp', type: :request do

  let(:valid_headers) { pvhwj }
  let(:invalid_headers) { patient_invalid_headers }
  let(:valid_attributes) do
    {
      sign_up: {
        name: (Faker::Name.first_name + ' ' + Faker::Name.last_name).gsub(/[^a-zA-Z0-9.\s]/, ''),
        email: Faker::Internet.free_email,
        phone: Faker::Number.leading_zero_number(digits: 12),
        password: 'secret',
        password_confirmation: 'secret'
      }
    }.to_json
  end
  let(:invalid_attributes) do
    {
      sign_up: {
        name: nil,
        email: nil,
        phone: nil,
        password: nil,
        password_confirmation: nil
      }
    }.to_json
  end

  describe 'POST /patient/v1/account/sign-up' do

    context 'and invalid params' do
      before { post patient_v1_account_sign_up_path, params: invalid_attributes, headers: valid_headers }

      it 'return 422 response' do
        expect(response).to have_http_status(422)
      end

      it 'return message `Unprocessable Entity`' do
        expect(json['response']['message']).to include('Unprocessable Entity')
      end
    end

    context 'and valid params' do
      before { post patient_v1_account_sign_up_path, params: valid_attributes, headers: valid_headers }

      it 'return 201 response' do
        expect(response).to have_http_status(201)
      end

      it 'return message `Created`' do
        expect(json['response']['message']).to include('Created')
      end

      it "return message '#{I18n.t(:account_was_created_successfully)}' in data key" do
        expect(json['data']['message']).to include(I18n.t(:account_was_created_successfully))
      end
    end

  end

end
