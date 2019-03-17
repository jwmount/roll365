ActiveAdmin.register Quote do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :project_id, :quote_to_id, :rep_id, :fire_ants, :fire_ants_verified_by, :inclusions, :expected_start, :duration, :council

end
