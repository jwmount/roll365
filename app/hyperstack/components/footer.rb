class Footer < HyperComponent

  
    render(DIV) do
      DIV do
      	"#{pluralize(Shipment.count, 'task')} total"
      end
        
      DIV do
        H4{'app links from a component'}
      end

    end
end
