# lib/tasks/demo.rake
desc "demo -- Run selected tasks db/seeds directory in specific sequence"

namespace :db do
  task demo: :environment do
    
    fl = "#{Rails.root}/db/migrate/scaffolds.rb" 
    #Process each seed file in /db/seeds
    
    load(fl)
      
    end

  
end