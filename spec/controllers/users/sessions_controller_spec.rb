require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  describe "POST #create" do
    let(:user) { create(:user) }

    it "returns a successful response with user data upon sign-in" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :create, params: { user: { email: user.email, password: user.password } }
      expect(response).to have_http_status(:ok)
      # expect(JSON.parse(response.body)['status']['message']).to eq("User signed in successfully")
    end
  end

  describe "DELETE #destroy" do
    let(:user) { create(:user) }
    let(:token) { JWT.encode({ sub: user.id }, Rails.application.credentials.fetch(:secret_key_base)) }

    it "returns a successful response upon sign-out" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      request.headers['Authorization'] = "Bearer #{token}"
      delete :destroy
      expect(response).to have_http_status(:ok)
      # expect(JSON.parse(response.body)['status']['message']).to eq("User signed out successfully")
    end

    # it "returns unauthorized if user has no active session" do
    #   @request.env["devise.mapping"] = Devise.mappings[:user]
    #   request.headers['Authorization'] = "Bearer invalid_token"
    #   delete :destroy
    #   expect(response).to have_http_status(:unauthorized)
    #   expect(JSON.parse(response.body)['status']['message']).to eq("User has no active session")
    # end
  end
end
