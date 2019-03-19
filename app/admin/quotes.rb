ActiveAdmin.register Quote do

  permit_params :name, :project_id, :quote_to_id, :rep_id, :fire_ants, :fire_ants_verified_by, :inclusions, :expected_start, :duration, :council

end
