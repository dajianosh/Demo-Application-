Rails.application.routes.draw do
  devise_for :employees
  devise_scope :employee do 
    root "devise/sessions#new"
  end  
  resources :employees, only: [:index, :show, :edit, :update]
  resources :candidates
end
