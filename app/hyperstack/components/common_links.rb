class CommonLinks < HyperComponent
  include Hyperstack::Router::Helpers

  render (DIV) do
    
    H4 {"Common-Links Component -- future features?"}
    
    A(href: '/') { 'Home' }
     
    #A(href: "http://localhost:5000/") {'Home 2'} works fine
    DIV do
      A(href: "http://localhost:5000/") {'Home 2'}
    end

  end
    
end