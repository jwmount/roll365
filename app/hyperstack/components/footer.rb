class Footer < HyperComponent

  
    render(DIV, class: :footer) do
      SPAN(class: 'roll365-count') do
        "#{pluralize(Shipment.count, 'task')} remain"
      end
    end
  

end
