# Resources should never be nested more than 1 level deep. -- https://guides.rubyonrails.org/routing.html#controller-namespaces-and-routing
Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

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
  resources :addresses, :companies, :projects, :conditions, :dockets,
            :engagements, :equipment, :identifiers, :jobs, :materials, :people, :people_schedules,
            :permits, :projects, :quotes, :requirements, :reservations, :schedules, :solutions,
            :solution_tips, :tips
  
  resources :companies, shallow: true do
    resources :addresses
    resources :initializers
  end

  resources :peopple, shallow: true do
    resources :addresses
  end

  #
  # A C T I V E  A D M I N   A C T I V E  A D M I N   A C T I V E  A D M I N   A C T I V E  A D M I N  
  #
  namespace :admin do
    
    resources :certificates, :companies, :conditions, :dashboard, :dockets, :engagements, :equipment,
             :identifiers, :jobs, :materials, :people, :people_schedules, :permits, :projects, :quotes, :requirements,
             :reservations, :schedules, :solutions, :solution_tips, :tips

  
  
# Shallow Nesting ONE level deep with collection methods defined for :Companies
# Section 2.7.2 Routing Rails BGides
#   collection methods (e.g. companies) are  only: [:index, :new, :create]
#   nested methods are  only: [:show, :edit, :update, :destroy]
    shallow do
      resources :companies do
        resources :people
      end
    end

    resources :companies, shallow: true do
      resources :projects
    end

    resources :companies, shallow: true do
      resources :addresses
    end
 

    shallow do
      resources :companies do
        resources :equipment
      end
    end

    shallow do
      resources :companies do
        resources :certificates
      end
    end

    resources :companies, shallow: true do
      resources :permits
    end
     
    
    resources :companies, shallow: true do
      resources :identifiers
    end

    resources :people, shallow: true do
      resources :addresses
    end
     
    resources :projects, shallow: true do
      resources :quotes
    end

 #   resources :quotes, shallow: true do
 #     resources :solutions
 #   end
    
    
   
  end #namespace

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end #routes
