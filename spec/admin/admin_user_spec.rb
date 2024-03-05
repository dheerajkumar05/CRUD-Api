require 'rails_helper'

RSpec.describe "AdminUsers", type: :feature do
  describe "AdminUser management" do
    let(:admin_user) { create(:admin_user) }

    before do
      sign_in admin_user
    end

    it "creates a new admin user" do
      visit new_admin_admin_user_path
      fill_in "Email", with: "new_admin@example.com"
      fill_in "admin_user[password]", with: "password"
      fill_in "admin_user[password_confirmation]", with: "password"
      click_button "Create Admin user"
       expect(page).to have_content("Admin user was successfully created.")
    end

    it "edits an admin user" do
      visit edit_admin_admin_user_path(admin_user)
      fill_in "Email", with: "updated_admin@example.com"
      click_button "Update Admin user"
       expect(page).to have_content("Admin user was successfully updated.")
       expect(page).to have_content("updated_admin@example.com")
    end

    it "deletes an admin user" do
      visit admin_admin_users_path
      click_link "Delete", match: :first
      expect(page).to have_content("Admin user was successfully destroyed.")
      expect(page).not_to have_content(admin_user.email)
    end
  end
end
