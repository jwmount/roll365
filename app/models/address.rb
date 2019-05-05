class Address < ApplicationRecord


# 
# Used by Company, Person, Project
#
  belongs_to :addressable, polymorphic: true
  
  #kaminari
  paginates_per  10

  #
  # D E F A U L T S 
  #
  after_initialize :defaults

  def defaults
     unless persisted?
      
       self.street_address     ||= nil
       self.city               ||= nil
       self.state              ||= nil
       self.post_code          ||= nil
       self.map_reference      ||= '(Please edit)'
       self.longitude          ||= '(please edit)'
       self.latitude           ||= 'Yes (please edit).'
          
     end
  end

  #
# Get and display parent name of polymorphic Address. [TODO]: remve after May 1
#
  def display_parent_name 
 	#@parent_name = "#{self.addressable_type}".constantize.find(self.addressable_id).name if unused
    @parent_name = self.addressable.name
  end

end
