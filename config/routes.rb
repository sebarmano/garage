Rails.application.routes.draw do
  root "dashboards#show"

  resource :dashboard, only: :show
  resource :calendar, only: :show
  resources :appointment_completions, only: [:new, :create]
  resources :appointments, only: [:index, :new, :create, :show] do
    member do
      put :confirm
      put :cancel
    end
  end
  resources :cars, only: [:new, :create]
  resources :customers, only: [:index, :new, :create]
  resources :available_hours, only: :index, format: :json
  resources :assignments, only: [:index, :edit, :update] do
    member do
      put :start
      put :complete
    end
  end
  resources :assignment_notes, only: :create
  devise_for :users, controllers: { registrations: "registrations" }
end
