require 'rails_helper'

RSpec.describe Api::V1::CompaniesController, type: :controller do
  let(:user) { create(:user) } 

  before do
  allow(controller).to receive(:current_user).and_return(user)
end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let(:company) { create(:company, user: user) } 

    it 'returns a successful response' do
      get :show, params: { id: company.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:company) } 
    it 'creates a new company' do
      expect {
        post :create, params: { company: valid_attributes }
      }.to change(Company, :count).by(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT #update' do
    let(:company) { create(:company, user: user) }
    let(:new_attributes) { { name: 'New Name' } }

    it 'updates the company' do
      put :update, params: { id: company.id, company: new_attributes }
      company.reload
      expect(company.name).to eq('New Name')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    let!(:company) { create(:company, user: user) } 
    it 'destroys the company' do
      expect {
        delete :destroy, params: { id: company.id }
      }.to change(Company, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end
  end
end
