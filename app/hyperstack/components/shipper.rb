class Shipper < HyperComponent

# how these get set t.b.d
  param pickup_time: "08:00am", type: String
  param end_points: "Portland - Norristown", type: String
  param deadline: "Noon", type: String
  param where_at: "Redding, CA", type: String
  param cargo: "Gravel", type: String
  param tracking_id: "AAA-BBB-CCC"
  param progress: "On Time"
  param expected_arrival: "12:15pm"
  param discrepancy: "none"

  render (DIV) do

    DIV(align: 'center') do
      H2 { 'Shipper (show)' }
    end

    #Table here
    
  end

end
