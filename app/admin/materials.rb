ActiveAdmin.register Material do

  menu label: "Materials", parent: "Admin"
  
  permit_params :name, :description

end
