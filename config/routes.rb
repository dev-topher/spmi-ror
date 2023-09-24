Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  get "/postulacion", to: 'student#index'

  


  get "/dashboard", to: 'admin#index'

  
end
