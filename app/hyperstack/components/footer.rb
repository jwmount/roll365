class Footer < HyperComponent
  
    render(DIV) do
      DIV do
      	"#{pluralize(Shipment.count, 'task')} total"
      end
        
      DIV do
      	CommonLinks()
      end
  end
end
