class Address < ApplicationRecord


# 
# Used by Company, Person, Project ... 
#
  belongs_to :addressable, polymorphic: true
  
  #
  # D E F A U L T S 
  #
  after_initialize :defaults

  def defaults
     unless persisted?
       self.street_address     ||= '(Please edit)'
       self.city               ||= '(Please edit)'
       self.state              ||= '(Please edit)'
       self.post_code          ||= '(Please edit)'
       self.map_reference      ||= '(Please edit)'
       self.longitude          ||= '(please edit)'
       self.latitude           ||= 'Yes (please edit).'
     end
  end

end
