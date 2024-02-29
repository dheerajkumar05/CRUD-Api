class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.string :country
      t.integer :zipcode
      t.string :phone_number
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
