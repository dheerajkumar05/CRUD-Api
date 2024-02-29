class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :country, :zipcode, :phone_number, :description
  belongs_to :user
end


