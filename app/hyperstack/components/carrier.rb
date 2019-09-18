class Carrier < HyperComponent

# how these get set t.b.d
  param company_name: "Wester Logistics", type: String
  param contact_points: "541 999-1212", type: String
  param tracking_id: "AAA-BBB-CCC"

  render (DIV) do

    DIV(align: 'center') do
      H2 { 'Carrier (show)' }
    end

      TABLE do
        TH {'Company Name'}
        TH {'Contact Points'}
        TH {'Tracking ID'}
        TR do
          TD {"#{company_name}"}
          TD {"#{contact_points}"}
          TD {"#{tracking_id}"}
        end

      end
    
  end

end