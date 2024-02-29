 Rails.application.routes.draw do
   devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registraions: 'users/registraions'
      }

      # resources :companies

      namespace :api do
        namespace :v1 do
          resources :companies
        end
      end
    end