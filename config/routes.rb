Rails.application.routes.draw do
  root "home#index"
  resource :dashboard, only: :show
  resources :appointments, only: [:new, :create]

  devise_for :users
end
