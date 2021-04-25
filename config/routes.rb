Rails.application.routes.draw do
  resources :email_addresses
  resources :contact_numbers
  resources :addresses
  resources :identities
  resources :hospitals
  devise_for :users
  resources :users do
    patch :confirm, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
