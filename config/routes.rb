Rails.application.routes.draw do
  resources :certs
  resources :engagements
  resources :solution_tips
  resources :people_schedules
  resources :schedules
  resources :dockets
  resources :conditions
  resources :certificates
  resources :requirements
  resources :materials
  resources :tips
  resources :identifiers
  resources :addresses
  resources :reservations
  resources :solutions
  resources :quotes
  resources :projects
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :equipment
  resources :jobs
  resources :people
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
