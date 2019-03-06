ActiveAdmin.register Address do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :street_address, :city, :state, :post_code, :map_reference, :latitude, :longitude
#
# 

end
