FactoryBot.define do
  factory :company do
    name { "Sample Reservation" }
    location { "faridabad" } 
    country { 'India' }
    zipcode { 121005 }
    phone_number { '88979464642' }
    description { "New company" }
    association :user, factory: :user
  end
end


