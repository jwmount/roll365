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
       self.city               ||= nil
       self.state              ||= nil
       self.post_code          ||= '(Please edit)'
       self.map_reference      ||= '(Please edit)'
       self.longitude          ||= '(please edit)'
       self.latitude           ||= 'Yes (please edit).'
     end
  end

  #
  # Our Address model is polymorphic to resources with names we want to display as addressable members.
  # Companies have .name attributes, People ... Addresses have neither.  
  # Why doesn't matter what this name is?  Not clear!
  #
  def display_name
    'Ralph'
  end


end
