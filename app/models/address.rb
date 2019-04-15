class Address < ApplicationRecord


# 
# Used by Company, Person, Project
  belongs_to :addressable, polymorphic: true
  
  #kaminari
  paginates_per  10
#
# Get and display parent name of polymorphic Address
#
  def display_parent_name 
    @parent_name = "#{self.addressable_type}".constantize.find(self.addressable_id).name
  end

end
