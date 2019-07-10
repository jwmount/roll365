class Footer < HyperComponent
  include Hyperstack::Router::Helpers

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

  render(DIV, class: :footer) do
    SPAN(class: 'roll365-count') do
      "#{pluralize(Shipment.count, 'task')} remain"
    end

    UL(class: :filters) do
      link_item(:ontime)
      link_item(:delayed)
      link_item(:completed)
    end
  end
    
end
