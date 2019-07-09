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
#    
#    DIV(class: [:footer, :tbg]) {  
#     "Roll365 does not employ, recommend or endorse any agent, broker, carrier or shipper nor are we 
#      responsible for the conduct of any agent, broker, carrier or shipper. Roll365.com provides information 
#      and tools to help agents, brokers, carriers and shippers make informed decisions.   
#      Where appropriate such services are built upon the Fr8.Network protocol including smart contracts and 
#      transactions, if any, rely on the Ethereum blockchain.  As of now no smart contact services are implemented."
#    }
    
end
