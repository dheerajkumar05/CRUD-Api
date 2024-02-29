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


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :location, :country, :zipcode, :phone_number, :description, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :location, :country, :zipcode, :phone_number, :description, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
