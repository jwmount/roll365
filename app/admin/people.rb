ActiveAdmin.register Person do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :first_name, :last_name, :title, :available, :available_on, :OK_to_contact, :active
=begin
   "last_name"=>"Cuellar",
   "title"=>"Manager",
   "available"=>"1",
   "available_on(1i)"=>"2019",
   "available_on(2i)"=>"3",
   "available_on(3i)"=>"4",
   "available_on(4i)"=>"01",
   "available_on(5i)"=>"24",
   "OK_to_contact"=>"1",
   "active"=>"1"},
 "commit"=>"Update Person",
=end

#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
