class Company < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness:true
  validates :location, presence: true
  validates :country, presence: true
  validates :zipcode, presence: true
  validates :phone_number, presence: true
  validates :description, presence: true
  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
   def self.ransackable_attributes(auth_object = nil)
    ["country", "created_at", "description", "id", "id_value", "location", "name", "phone_number", "updated_at", "user_id", "zipcode"]
  end
end
