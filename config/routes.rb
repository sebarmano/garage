Rails.application.routes.draw do
  resource :dashboard, only: :show

  devise_for :users
  root to: "dashboards#show"
end
