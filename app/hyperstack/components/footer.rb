class Footer < HyperComponent
  include Hyperstack::Router::Helpers
  # param :my_param
  # param param_with_default: "default value"
  # param :param_with_default2, default: "default value" # alternative syntax
  # param :param_with_type, type: Hash
  # param :array_of_hashes, type: [Hash]
  # other :attributes  # collects all other params into a hash
  # fires :callback  # creates a callback param

  # access params using the param name
  # fire a callback using the callback name followed by a !

  # state is kept and read as normal instance variables
  # but when changing state prefix the statement with `mutate`
  # i.e. mutate @my_state = 12
  #      mutate @my_other_state[:bar] = 17

  # the following are the most common lifecycle call backs,
  # delete any that you are not using.
  # call backs may also reference an instance method i.e. before_mount :my_method

  before_mount do
    # any initialization particularly of state variables goes here.
    # this will execute on server (prerendering) and client.
  end

  after_mount do
    # any client only post rendering initialization goes here.
    # i.e. start timers, HTTP requests, and low level jquery operations etc.
  end

  before_update do
    # called whenever a component will be re-rerendered
  end

  before_unmount do
    # cleanup any thing before component is destroyed
    # note timers are broadcast receivers are cleaned up
    # automatically
  end

  def link_item(path)
    LI { NavLink("/#{path}", active_class: :selected) { path.camelize } }
  end
  render(DIV, class: :footer) do
    SPAN(class: 'todo-count') do
      "#{pluralize(Shipment.ontime.count, 'item')} left"
    end
    UL(class: :filters) do
      link_item(:ontime)
      link_item(:delayed)
      link_item(:completed)
    end
  end
  'xx'
end


=begin  render do
  
      DIV(class: [:footer]) {  
        "Roll365.com does not employ, recommend or endorse any agent, broker, carrier or shipper nor are we 
        responsible for the conduct of any agent, broker, carrier or shipper. Roll365.com provides information 
        and tools to help agents, brokers, carriers and shippers make informed decisions.   
        Where appropriate such services are built upon the Fr8.Network protocol including smart contracts and 
        transactions, if any, rely on the Ethereum blockchain.  As of now no smart contact services are implemented."
      }
    
  end
=end
