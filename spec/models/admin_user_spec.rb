require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'validations' do
    it 'validates presence of email' do
      admin_user = AdminUser.new(password: 'password')
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:email]).to include("can't be blank")
    end

    it 'validates presence of password' do
      admin_user = AdminUser.new(email: 'test@example.com')
      expect(admin_user).not_to be_valid
      expect(admin_user.errors[:password]).to include("can't be blank")
    end
  end

  describe 'methods' do
    describe '.ransackable_attributes' do
      it 'returns expected attributes' do
        expected_attributes = ["created_at", "email", "encrypted_password", "id", "id_value", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
        expect(AdminUser.ransackable_attributes).to match_array(expected_attributes)
      end
    end
  end
end
