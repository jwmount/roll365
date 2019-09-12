class Shipper < HyperComponent

  param shipper_name: "Peas-n-pods", type: String

  render DIV do
    H2 { 'Shippers (show/hide)' }
    H2 { "#{shipper_name} Shipper (to be set by param)" }
    H2 { 'Shippers' }
    H3 { '* Find or enter shipper name' }
    H3 { '.... etc. '}
  end

end
