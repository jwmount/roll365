class Driver < HyperComponent

  param driver_name: "JWM", type: String

  render (DIV) do
    # H1 { "#{driver_name} Drivers" }
    H2 { 'Drivers (show/hide)' }
    H3 { '* Find or enter name of driver'}
    H3 { 'Location' }
    H3 { 'Operating status' }
    H3 { 'ETOA - DTA'}
    H3 { 'Other stuff...' }
  end

end
