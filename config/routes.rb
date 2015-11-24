Rails.application.routes.draw do
  root "home#index"
  resource :dashboard, only: :show
  resources :appointments, only: [:new, :create]
  resources :cars, only: [:new, :create]

  devise_for :users, controllers: { registrations: "registrations" }
end
