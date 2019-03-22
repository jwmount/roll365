# refer to /config/initializers/inflections.rb
# my_engine/lib/my_engine/engine.rb

require_relative '../../config/initializers/inflections'

module admin
  class admin < ::Rails::admin
    # ...
  end
end