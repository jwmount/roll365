# app/hyperstack/components/shipment_item.rb
class ShipmentItem < HyperComponent

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

  
  param :shipment

  render do

    UL do
      
      if @expanded

        DIV do
          
          DIV(class: 'roll365-app') { "#{shipment.tracking_id}  " }     
  
          UL(class: 'roll365-app') do
            LI { "Segment: #{shipment.ship_from} to #{shipment.ship_to}" }
            LI { "Carrying: #{shipment.cargo}" }
            LI { "Departed: #{shipment.deadline}, ETOA: 04:00 today"}
            LI { "On Time"} if shipment.ontime unless shipment.delayed
            #P ( :tbg ) { "DELAYED (randomly assigned)"} if shipment.delayed   # ? :tbg doesn't seem to work
          end #UL
        end #DIV
      else
        DIV { " #{shipment.tracking_id}" }
      end #if

    end #UL
    .on(:click) { toggle(:expanded) }
  end #render

end

