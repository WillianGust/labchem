Rails.application.routes.draw do
  resources :table_employees
  resources :raw_materials
  resources :formulations

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "formulations#index"
end
