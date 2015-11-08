Rails.application.routes.draw do
  root "home#index"
  resource :dashboard, only: :show
  resources :appointments, only: :new

  devise_for :users
end
