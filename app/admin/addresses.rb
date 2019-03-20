  ActiveAdmin.register Address do

  menu parent: "Admin"


  belongs_to :company, :optional => true
  permit_params :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude



end