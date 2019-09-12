class Carrier < HyperComponent

  param carrier_name: "Trucks-r-Us", type: String

  render (DIV) do
    H2 { 'Carriers (show/hide)' }
    H2 { "#{carrier_name} Carrier, (to be set by param)" }
    H3 { '* Find or enter carrier name' }
    H3 { '.... etc. '}
  end

end
