# spec/admin/companies_spec.rb

require 'rails_helper'

RSpec.describe 'Admin Company', type: :feature do
  let!(:admin_user) { create(:admin_user, email: 'admin@example.com', password: 'password', password_confirmation: "password") }
  let(:company_attributes) { attributes_for(:company) }

  before do
    login_as(admin_user, scope: :admin_user)
  end

    it 'displays the companies index page' do
      visit admin_companies_path

      expect(page).to have_content('Companies')
      expect(page).to have_content('Name')
      expect(page).to have_content('Location')
      expect(page).to have_content('Country')
      expect(page).to have_content('Zipcode')
      expect(page).to have_content('Phone number')
      expect(page).to have_content('Description')
      expect(page).to have_content('User')


    end

    it 'allows creation of a new company' do
      visit new_admin_company_path

      fill_in 'Name', with: 'Test Company'
      fill_in 'Location', with: 'Test Location'
      fill_in 'Country', with: 'Test Country'
      fill_in 'Zipcode', with: '12345'
      fill_in 'Phone number', with: '1234567890'
      fill_in 'Description', with: 'Test Description'
      fill_in 'User', with: '1' # Assuming 1 is a valid user ID

      click_button 'Create Company'

      # expect(page).to have_content('Company was successfully created.')
    end

  end