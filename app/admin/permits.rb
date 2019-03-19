ActiveAdmin.register Permit do

  menu label: "Permits", parent: "Compliance"

#
# ActiveAdmin Associations for nesting
#
  belongs_to :company, :optional => true
  belongs_to :person, :optional => true
  belongs_to :equipment, :optional => true

  permit_params :permitable_id, :permitable_type, 
                :name, :description, :issuer, :jurisdiction, :basis, :required,
                :for_person, :for_company, :for_equipment, :for_location, :permanent,
		        :valid_from, :valid_to  
end