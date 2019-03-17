ActiveAdmin.register Requirement do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :certificate_id, :for_person, :for_company, :for_location, :preference, :description

end
