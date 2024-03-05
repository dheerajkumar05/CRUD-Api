ActiveAdmin.register Company do


  form do |f|
    f.inputs 'Companies' do
      f.inputs :name, :as => :string
      f.inputs :location, :as => :string
      f.input  :country, :as => :string
      f.inputs :zipcode, :as => :integer
      f.inputs :phone_number, :as => :string
      f.inputs :description, :as => :text
      f.inputs :user_id, :as => :string

    end
    f.actions
  end


   permit_params :name, :location, :country, :zipcode, :phone_number, :description, :user_id
  
end
