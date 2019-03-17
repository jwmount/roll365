ActiveAdmin.register Certificate do

  menu parent: "Compliance"

  
  index do
    column :name , :sortable => 'name' do |certificate|
      link_to certificate.name, admin_certificate_path(certificate)
    end
    column :description
    column :for_person do |certificate|
      status_tag (certificate.for_person ? "YES" : "No"), (certificate.for_person ? :ok : :error)
    end    
    column :for_company do |certificate|
      status_tag (certificate.for_company ? 'YES' : 'No'), (certificate.for_company ? :ok : :error)
    end    
    column :for_equipment do |certificate|
      certificate.for_equipment ? 'YES' : 'No'
      status_tag (certificate.for_equipment ? "YES" : "No"), (certificate.for_equipment ? :ok : :error)      
    end    
    column :for_location do |certificate|
      status_tag (certificate.for_location ? 'YES' : 'No'), (certificate.for_location ? :ok : :error)
    end    

    column :active do |certificate|
      status_tag (certificate.active ? "YES" : "No"), (certificate.active ? :ok : :error)      
    end    
  end
  
  form do |f|
   
    f.inputs "Certificate" do
      f.input :name,          
              :required => true,
              :placeholder => "Name"
      f.input :description, 
              :placeholder => "Description"
      f.input :active, 
              :as => :radio
      f.input :for_company
      f.input :for_equipment
      f.input :for_person
      f.input :for_location

    end
    #f.buttons
    f.actions
  end
       
  show :title => 'Certificate Details' do
    h3 certificate.name
    panel "Certificate Details" do
      attributes_table_for certificate do
        row("Name") { certificate.name }
        row("Active") { status_tag (certificate.active ? "YES" : "No"), (certificate.active ? :ok : :error) }
        row("Description") {certificate.description}
        row("For Company") { status_tag (certificate.for_company ? "YES" : "No"), (certificate.for_company ? :ok : :error) }
        row("For Equipment") { status_tag (certificate.for_equipment ? "YES" : "No"), (certificate.for_equipment ? :ok : :error) }
        row("For Location") { status_tag (certificate.for_location ? "YES" : "No"), (certificate.for_location ? :ok : :error) }
        row("For Person") { status_tag (certificate.for_person ? "YES" : "No"), (certificate.for_person ? :ok : :error) }
      end
    end
    active_admin_comments
  end          

#
# W H I T E  L I S T  M A N A G E M E N T
#
# This arrangement works too, but not for what we might want, for exampple allowing you to enter a name and 
# description pand the for_ values later.   We can work this out so it's not possible to go forward without a 
# valid, at least complete, required document.  See the Rails Guide.
# 
  permit_params :name, :description, :for_person, :for_company, :for_equipment, :for_location, :active


end
