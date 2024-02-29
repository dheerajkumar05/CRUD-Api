require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:user) { create(:user) } 

  it 'is valid with valid attributes' do
    company = build(:company, user: user)
    expect(company).to be_valid
  end

  it 'is invalid without a name' do
    company = build(:company, user: user, name: nil)
    expect(company).to_not be_valid
  end

  it 'is invalid with a duplicate name' do
    existing_company = create(:company, user: user, name: 'Example Company')
    company = build(:company, user: user, name: 'Example Company')
    expect(company).to_not be_valid
  end

  it 'is invalid without a location' do
    company = build(:company, user: user, location: nil)
    expect(company).to_not be_valid
  end

  it 'is invalid without a country' do
    company = build(:company, user: user, country: nil)
    expect(company).to_not be_valid
  end

  it 'is invalid without a zipcode' do
    company = build(:company, user: user, zipcode: nil)
    expect(company).to_not be_valid
  end

  it 'is invalid without a phone number' do
    company = build(:company, user: user, phone_number: nil)
    expect(company).to_not be_valid
  end

  it 'is invalid without a description' do
    company = build(:company, user: user, description: nil)
    expect(company).to_not be_valid
  end
end
