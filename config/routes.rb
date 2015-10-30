Rails.application.routes.draw do
  get 'dashboards/show'

  devise_for :users
  root to: "dashboards#show"
end
