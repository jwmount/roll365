Rails.application.routes.draw do
  resources :addresses

  resources :certificates
  resources :certs
  resources :companies
  resources :conditions

  resources :dashboard
  resources :dockets
  
  resources :engagements
  resources :equipment

  resources :identifiers
  resources :jobs

  resources :materials

  resources :people
  resources :people_schedules
  resources :projects

  resources :quotes
  resources :requirements
  resources :reservations

  resources :schedules
  resources :solutions
  resources :solution_tips
  
  resources :tips
  
    
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  #resources :companies

 namespace :admin do
   resources :people
   resources :companies do
      resources :equipment
      resources :projects
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
