Rails.application.routes.draw do
  root "dashboards#show"

  resource :dashboard, only: :show
  resources :appointments, only: [:index, :new, :create] do
    member do
      put :confirm
      put :cancel
    end
  end
  resources :cars, only: [:new, :create]
  resources :customers, only: [:index, :new, :create]
  resources :available_hours, only: :index, format: :json

  devise_for :users, controllers: { registrations: "registrations" }
end
