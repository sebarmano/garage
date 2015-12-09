Rails.application.routes.draw do
  root "home#index"
  resource :dashboard, only: :show
  resources :appointments, only: [:index, :new, :create] do
    collection do
      put :confirm
    end
  end
  resources :cars, only: [:new, :create]
  resources :available_hours, only: :index, format: :json

  devise_for :users, controllers: { registrations: "registrations" }
end
