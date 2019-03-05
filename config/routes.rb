Rails.application.routes.draw do
  resources :projects
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :equipment
  resources :jobs
  resources :people
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
