Rails.application.routes.draw do
  get 'sign/up'
  devise_for :users
  root to: "pages#home"
  # get "about", to: "pages#about"
  get "about", to: "about#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :balances do
    resources :transactions, only: [:new,:show]
  end
  resources :target_amounts
  resources :transactions, only: [:index]
  resources :balances, only: :create
end
