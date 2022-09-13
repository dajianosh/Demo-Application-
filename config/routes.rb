Rails.application.routes.draw do
  root "employees#index"
  resources :employees, only: [:index, :show]
  resources :registrations, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy] 
end
