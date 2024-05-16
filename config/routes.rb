Rails.application.routes.draw do
  get 'dogs/index'
  post 'dogs/view'

  root 'dogs#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
