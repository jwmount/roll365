class Driver < HyperComponent
  
  # how these get set t.b.d
  param driver_name: "John x Miller", type: String
  param where_at: "Norristown", type: String
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
      H2 { 'Driver (hide)' }
    end

    DIV(class: 'roll365-app') do

      TABLE do
        TH {'Driver'}
        TH {'Where At'}
        TH {'Segment Endpoints'}
        TH {'Deadline'}
        TH {'Present location'}
        TH {'Cargo'}
        TH {'Tracking ID'}
        TH {'Status'}
        TH {'Expected Arival'}
        TH {'Discrepancy (+-)'}
        TR do
          TD {"#{driver_name}"}
          TD {"#{where_at}"}
          TD {"#{end_points}"}
          TD {"#{deadline}"}
          TD {"#{where_at}"}
          TD {"#{cargo}"}
          TD {"#{tracking_id}"}
          TD {"#{progress}"}
          TD {"#{expected_arrival}"}
          TD {"#{discrepancy}"}
        end
      end
    end
  end
end
