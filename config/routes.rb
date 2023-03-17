Rails.application.routes.draw do
  resources :raw_materials
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "raw_materials#index"
  # get 'raw_materials', to: 'raw_materials#index'
  # get 'raw_materials/new', to: 'raw_materials#new'
  # get 'raw_materials/:id', to: 'raw_materials#show'
  # get 'raw_materials/:id/edit', to: 'raw_materials#edit'
  # post 'raw_materials', to: 'raw_materials#create'
  # delete 'raw_materials/:id', to: 'raw_materials#destroy'
  # put 'raw_materials/:id', to: 'raw_materials#update'
  # patch 'raw_materials/:id', to: 'raw_materials#update'
end
