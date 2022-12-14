Rails.application.routes.draw do
  devise_for :employees
  devise_scope :employee do 
    root "devise/sessions#new"
  end  
  resources :employees, only: [:index, :show, :edit, :update]
  resources :skills, only: [:create, :new, :index]
  resources :candidates
  resources :interviews do
    resources :interview_feedbacks
  end
end
