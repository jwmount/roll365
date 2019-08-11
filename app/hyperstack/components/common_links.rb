class CommonLinks < HyperComponent
  include Hyperstack::Router::Helpers

  render (DIV) do

    H4 {"Common Services Component -- future features?"}


    #A(href: "http://localhost:5000/") {'Home 2'} works fine
    DIV(class: 'roll365-app') do
      A(href: '/') { '  Home  ' }
      A(href: "http://localhost:5000/") {'  Home 2  '}
      P
      BODY { '10:11:15: Departed inspection station at Ashland Northbound.' }
    end

  end

end
