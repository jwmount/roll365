class CommonLinks < HyperComponent
  include Hyperstack::Router::Helpers

  render (DIV) do

    H4 {"Common Services Component -- future features?"}

    DIV(class: 'roll365-app') do
      FOOTER { '10:11:15: Departed inspection station at Ashland Northbound. (Simulated)' }
    end
    DIV do
      A(href: '/') { '  Home  ' }
      A(href: "/shipments") {'  Shipments  '}
    end
  end
end
