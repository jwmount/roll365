class Driver < HyperComponent

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
      H2 { 'Drivers (show/hide)' }
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
          TD {"#{'AAA-BBB-CCC'}"}
          TD {'On Time'}
          TD {'00:12pm'}
          TD {'-12 min'}
        end
      end
    end
  end
end
