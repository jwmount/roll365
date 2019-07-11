class Footer < HyperComponent
  #include Hyperstack::Router::Helpers
  #include Hyperstack::Router

=begin
  def link_item(path)
    LI do
      # P R O B L E M  H E R E -- NavLink statement crashes
      # Show paths and a placeholder
      DIV { path.camelize + ' Na Na NavLink()' }
      #NavLink("/#{path}", active_class: :selected) do
      #  path.camelize
      #end
    end
  end
=end
  render(DIV, class: :footer) do
    SPAN(class: 'roll365-count') do
      "#{pluralize(Shipment.count, 'task')} remain?"
    end
    
=begin
    UL(class: :filters) do
      link_item(:ontime)
      link_item(:delayed)
      link_item(:completed)
    end
=end
  end

end
