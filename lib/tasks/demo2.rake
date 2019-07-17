# lib/tasks/demo2.rake
desc "demo2 -- Run selected tasks db/seeds directory in specific sequence"

@seed_files = [
	
	"sow_all",
  "shipments", 
	"seeds_summary"
]


namespace :db do
  task demo2: :environment do
    
    #Process each seed file in /db/seeds
    
    @seed_files.each do |filename|
    	fl = "#{Rails.root}/db/seeds/#{filename}.rb" 
      puts "Seeding:  #{fl}."
      load(fl)
      
    end
  end
end