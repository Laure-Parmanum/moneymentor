Rails.application.routes.draw do
  # get 'sign/up'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  # Defines the root path route ("/")
  # root "articles#index"

end
