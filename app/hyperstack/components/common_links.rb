class CommonLinks < HyperComponent
  include Hyperstack::Router::Helpers

  render (DIV) do
    
    A(href: '/') { 'Home' }
    
    #A(href: "http://localhost:5000/") {'Home 2'} works fine
    DIV do
      A(href: "http://localhost:5000/") {'Home 2'}
    end

  end
    
end