ActiveAdmin.register Requirement do

  permit_params :certificate_id, :for_person, :for_company, :for_location, :preference, :description

  menu label: "Requirements", parent: "Admin"
end
