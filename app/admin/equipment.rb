ActiveAdmin.register Equipment do


  permit_params :name, :description

  belongs_to :company, :optional => true
  
    
  sidebar "Equipment Context", only: [:show, :edit] do 
    ul do
      li link_to "Dashboard", admin_dashboard_path
    end
  end  


  index do
    selectable_column
    
    column :name
    
    column :name, sortable: :name do |equipment|
      link_to equipment.name, admin_company_equipment_path(equipment.company.id, equipment.id), :class => "member_link"
    end

    column :permits do |equipment|
      render equipment.permits
    end

  end  


  #[TODO] Need to resolve nesting in order to create new equipment -- whose is it?
  
  form do |f|

    f.semantic_errors *f.object.errors.keys    

    f.inputs "Equipment for #{f.company.name}" do

      f.input :name,
              :as                   => :select,
              :collection           => equipment.equipment_list,
              :include_blank        => false,
              :hint                 => AdminConstants::ADMIN_EQUIPMENT_NAME_HINT
      end                  
      
    # DRY -- not DRY, people, companies, tips also do this
    f.inputs do

      f.has_many :permits do |f|
        
        f.input :certificate,
                :collection         => Certificate.where({:for_equipment => true}),
                :hint               => AdminConstants::ADMIN_EQUIPMENT_CERTIFICATE_HINT,
                :include_blank      => false

        f.input :active

        f.input :expires_on, 
                :as                 => :date_picker,
                :hint               => AdminConstants::ADMIN_EQUIPMENT_EXPIRES_ON_HINT

        f.input :permanent

        f.input :serial_number, 
                :hint               => AdminConstants::ADMIN_EQUIPMENT_SERIAL_NUMBER_HINT
      end
    end
    f.actions
    end
       
  show do

    attributes_table do
      rows :name, :company
      row ("Certifications") { render equipment.permits}

    end
    
=begin    
    panel 'Certificates' do
      attributes_table_for(equipment) do
        certs = equipment.certs.where({:for_equipment => true})
        certs.each do |cert|
          row("#{cert.certificate.name}") {"#{cert.serial_number}"}
        end
      end
    end
=end
    active_admin_comments
  end          


end
