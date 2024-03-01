require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: { email: 'test@example.com', password: 'password' } }
        }.to change(User, :count).by(1)
      end

      it 'returns a JSON response with success message and user data' do
        post :create, params: { user: { email: 'test@example.com', password: 'password' } }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['status']['message']).to eq('Signed in successfully')
        expect(JSON.parse(response.body)['status']['data']['email']).to eq('test@example.com')
      end
    end

    context 'with invalid params' do
      it 'does not create a new user' do
        expect {
          post :create, params: { user: { email: 'invalid_email', password: 'password' } }
        }.not_to change(User, :count)
      end

      it 'returns a JSON response with error message' do
        post :create, params: { user: { email: 'invalid_email', password: 'password' } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['status']['message']).to eq('User could not be created successfully')
        expect(JSON.parse(response.body)['status']['errors']).to include("Email is invalid")
      end
    end
  end
end
