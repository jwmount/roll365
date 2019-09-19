class Receiver < HyperComponent

  # how these get set t.b.d
  param deadline: "10.27 9/12", type: String
  param tracking_id: "AAA-BBB-CCC", type: String
  param end_points: "Sacramento - Long Beach", type: String
  param driver_name: "Bill Rollons", type: String

  param origin: "Oakland", type: String
  param cargo: "Frozen vegetables", type: String
  param status: "Deployed", type: String
  param expected_time_of_arrival: "2hrs, 15mm", type: String
  param discrepancy: "45 min", type: String

  render (DIV) do

    DIV(align: 'center') do
      H2 { 'Receiver (hide)' }
    end

    DIV(class: 'roll365-app') do

      TABLE do
        TH {'Deadline'}
        TH {'Tracking ID'}
        TH {'Segment End Points'}
        TH {'Driver_name'}
        TH {'Origin'}
        TH {'Cargo'}
        TH {'Status'}
        TH {'Expected Time of Arival'}
        TH {'Discrepancy (+-)'}
        TR do
          TD {"#{deadline}"}
          TD {"#{tracking_id}"}
          TD {"#{end_points}"}
          TD {"#{driver_name}"}
          TD {"#{origin}"}
          TD {"#{cargo}"}
          TD {"#{status}"}
          TD {"#{expected_time_of_arrival}"}
          TD {"#{discrepancy}"}
        end
      end
    end
  end
end
