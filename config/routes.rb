Rails.application.routes.draw do
  root "dashboards#show"

  resource :dashboard, only: :show
  resource :calendar, only: :show
  resources :appointment_assignments, only: [:new, :create]
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
