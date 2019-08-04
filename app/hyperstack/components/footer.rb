class Footer < HyperComponent

  
    render(DIV) do
      DIV do
      	"#{pluralize(Shipment.count, 'task')} total"
      end
        
      DIV do
      	CommonLinks(class: :footer)
      end

      DIV  do
      	P(class: :footer) {'Roll365.com does not employ, recommend or endorse any agent, broker, 
      		carrier or shipper nor are we responsible for the conduct of any agent, broker, carrier 
      		or shipper. Roll365.com provides information and tools to help agents, brokers, carriers 
      		and shippers make informed decisions.   Where appropriate such services may be built 
      		upon the Fr8.Network protocol including smart contracts and transactions, if any, 
      		rely on the Ethereum blockchain.  As of now no smart contact services are implemented.'}
      end
  end
end
