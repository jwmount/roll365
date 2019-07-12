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
          
          DIV { "#{shipment.tracking_id}" }
          DIV { "expanded:"}
          UL do
            LI { "from: #{shipment.ship_from}" }
            LI { "to: #{shipment.ship_to}" }
            LI { "cargo: #{shipment.cargo}" }
          end #UL
        end #DIV
      else
        DIV { " #{shipment.tracking_id}" }
      end #if

    end #UL
    .on(:click) { toggle(:expanded) }
  end #render

end

