# shipments.rb
# rake file to load some random set of Shipments
# 
=begin
 create_table "shipments", force: :cascade do |t|
    t.string "tracking_id"
    t.string "ship_from"
    t.string "ship_to"
    t.string "pickup"
    t.string "deadline"
    t.boolean "ontime"
    t.boolean "completed"
    t.boolean "delayed"
    t.text "cargo"
    t.string "utilization"
    t.text "quote_basis"
    t.decimal "quote_complete"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
=end

  def rstr
  	(0...15).map { ('a'..'z').to_a[rand(26)] }.join
  end

  def distro_ctr
  end

  def status
    true
  end

  puts 'Begin Shipments'
  
  20.times {
    ship = Shipment.create!( tracking_id: rstr(),
      ship_from: rstr, ship_to: rstr,
      pickup: rstr, deadline: rstr,
      ontime: true, completed: true, delayed: true,
      status: 0 )
    ship.save
    puts ship.tracking_id
    }
  
  
 
