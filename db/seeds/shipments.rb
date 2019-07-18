# shipments.rb
# rake file to load some random set of Shipments
# 
# executes as part of rake db:demo2
require 'pp'

  @centers = ['Medford', 'Weed', 'Eugene', 'Portland', 'Seattle', 'Sacramento']
  @cargos = ['Apples', 'Consumer goods', 'livestock', 'Clean soil', 'Automobiles', 'Agricultural chemicals']

  
  def rstr
  	(0...4).map { ('A'..'z').to_a[rand(52)] }.join
  end

  # make two strings and hyphenate them
  def tid
    rstr + '-' + rstr
  end

  puts 'Begin Shipments'
  

  # Remove old ones
  Shipment.delete_all
  
  

  20.times {
    ship = Shipment.create!( tracking_id: tid,
      ship_from: @centers[rand(6)], 
      ship_to: @centers[rand(6)],

      pickup: rand(7.days).seconds.from_now.beginning_of_hour,
      deadline: rand(8.days).seconds.from_now.beginning_of_hour,

      cargo: @cargos[rand(6)],

      ontime: rand(2),          # random boolean
      completed: rand(2), 
      delayed: rand(2),

      status: rand(2)
      )
    ship.save
    pp ship #.tracking_id, ship.ontime, ship.delayed, ship.completed, ship.cargo
    }
  
  
 
