FactoryBot.define do
  factory :user do
    # Add any attributes needed for your User model
    email { 'user@example.com' }
    password { 'password' }
  end
end