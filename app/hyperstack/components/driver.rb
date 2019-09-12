class Driver < HyperComponent

  param driver_name: "JWM", type: String

  render (DIV) do
    # H1 { "#{driver_name} Drivers" }
    H1 { 'Drivers' }
  end

end
