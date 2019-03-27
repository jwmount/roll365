require 'active_support/core_ext/integer/inflections.rb'

  ActiveAdmin.register Address do

  menu parent: "Admin"


  belongs_to :company, :optional => true
  permit_params :addressable_type, :addressable_id, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude

end