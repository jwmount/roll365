class Address < ApplicationRecord


  belongs_to :addressable, polymorphic: true

#
# Get and display parent name of polymorphic Address
#
  def display_parent_name 
    @parent_name = "#{self.addressable_type}".constantize.find(self.addressable_id).name
  end

end
