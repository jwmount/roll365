# Resources should never be nested more than 1 level deep. -- https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing
Rails.application.routes.draw do

#
# These next 3 lines create the ActiveAdmin rails engine.  Can be removed to cut down on the clutter 
# of routes.  This will cause a dyno fail 503, Service not available.  
# [TODO]  Decide how to handle this.
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # Generate routes for ActiveAdmin resources
  # ActiveAdmin.routes(self)

  # use rails g controller welcome to direct root references to welcome index and the get is what to do there
  get 'welcome/index'
  root 'welcome#index'  
  
  #
  # Generate paths for footer.  These paths rely on methods defined in the WelcomeController.
  # There is no dashboard page at this time so no paths are needed.
  #
  
  get 'about', to: :show, controller: 'welcome'
  get 'advertise', to: :show, controller: 'welcome'
  get 'contact', to: :show, controller: 'welcome'
  get 'dashboard', to: :show, controller: 'welcome'
  get 'faq', to: :show, controller: 'welcome'
  get 'license', to: :show, controller: 'welcome'
  get 'privacy', to: :show, controller: 'welcome'
  get 'tsandcs', to: :show, controller: 'welcome'

 # return from edit address to 'addressable#index'.
 get 'ncaddr', to: :ncaddr, controller: 'addresses'
 
  # UJS - DEPRECATED ?
  scope :ujs, defaults: { format: :ujs } do
    patch 'thing_totals' => 'companies#totals'
  end 
  
  # Resource paths
  
  # try shallow_path option
  scope shallow_path: "organizations" do
    resources :companies do
      resources :addresses, shallow: true
      resources :identifiers, shallow: true
      resources :people, shallow: true
    end
  end
  
  scope shallow_path: "individuals" do
    resources :people do
      resources :addresses, shallow: true
      resources :identifiers, shallow: true
    end
  end

  

  resources :addresses, :conditions, :materials, :equipment, :tips
            
            #:dockets, :projects, :engagements, :jobs, :people_schedules,
            #:permits, :projects, :quotes, :requirements, :reservations, :schedules, :solutions,
            #:solution_tips
  
end #routes
