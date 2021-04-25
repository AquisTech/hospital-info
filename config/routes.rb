Rails.application.routes.draw do
  concern :with_datatable do
    post :datatable, on: :collection
  end
  resources :work_times, concerns: [:with_datatable]
  resources :allocations
  resources :projects
  resources :bank_accounts
  resources :email_addresses
  resources :contact_numbers
  resources :addresses
  resources :identities
  resources :clients
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
