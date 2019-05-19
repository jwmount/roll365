# Resources should never be nested more than 1 level deep. -- https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing
Rails.application.routes.draw do

# rake routes > routes.txt  for inspection in editor
# rake routes -c 'get'      to see verbs
# rake routes -g '<path>'.  to see paths and prfixes

#
# These next 3 lines create the ActiveAdmin rails engine.  Can be removed to cut down on the clutter 
# of routes.  This will cause (or at least lead to) a dyno fail 503, Service not available.  
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

  # UJS - DEPRECATED ?
  scope :ujs, defaults: { format: :ujs } do
    patch 'thing_totals' => 'companies#totals'
  end 
  
  # Resource paths
  
  # try shallow_path option, reference 2.7.2 Shallow Nesting, Rails Routing from the Outside In, Guides
  # ... only build routes with the minimal amount of information to uniquely identify the resource...
  resources :companies do
    resources :addresses, only: [:index, :show, :edit, :new, :create]
    resources :identifiers, only: [:index, :new, :create]
    resources :people
  end
  resources :companies
  resources :addresses, only: [:show, :edit, :update, :destroy]
  resources :identifiers, only: [:show, :edit, :update, :destroy]  
  
  resources :people do
    resources :addresses, only: [:index, :show, :edit, :new, :create]
    resources :identifiers, only: [:index, :new, :created]
  end

  # provides paths that are not nested with Company
  resources :people

  # Support maintaining the index actions.
  # Ths REQUIRES that addrressable_type be provided.
  # These will be matches made last in matchhing order.
  
  # rails routes -g addresses
  resources :addresses
  
  # rails routes -g identifiers
  resources :identifiers
 

=begin  
  scope shallow_prefix: "organizations" do
    resources :companies do
      resources :addresses, shallow: true
      resources :people, shallow: true
    end
  end

  scope shallow_prefix: "organizations" do
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
=end
  

  resources :conditions, :materials, :equipment, :tips
            
            #:dockets, :projects, :engagements, :jobs, :people_schedules,
            #:permits, :projects, :quotes, :requirements, :reservations, :schedules, :solutions,
            #:solution_tips
  
end #routes
