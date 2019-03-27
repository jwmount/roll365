ActiveAdmin.register Person do

# Menu placement matters, crashes if placed after association with company (path not found)
# Does NOT work here either!  No effect.  
#  menu parent: "Admin"

# The statement below SCOPES the association between Company and Person for index purposes.
# When this statement is in effect, there is not way to index All persons.  usually this is fine.
# Only when belongs_to is NOT in effect is there a People menu generated.
# All paths for Person are modified to contain company_id.  E.g. column Name in index.
  belongs_to :company  

#
# W H I T E L I S T   W H I T E L I S T   W H I T E L I S T   W H I T E L I S T   W H I T E L I S T  
#
  permit_params  :company_id, :first_name, :last_name, :title, :role, :available, :available_on, :OK_to_contact, :active,

                    companies_attributes: [:name, :credit_terms, :PO_required, :active, :bookkeeping_number, :line_of_business, :url, :licensee],

                    addresses_attributes: [ :id, :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude],
                
                    identifiers_attributes: [:id, :identifiable_id, :identifiable_type, :name, :value, :rank],
                
                    permits_attributes: [:id, :permitable_id, :permitable_type, :name, :description, :issuer, :jurisdiction, 
                          :basis, :required, :for_person, :for_company, :for_equipment, :for_location, :permanent,
                          :valid_from, :valid_to]
  
# Eager loading to improve page performance
  includes :addresses, :identifiers, :permits

#
# I N D E X / L I S T  C O N T E X T
#
  sidebar "Current Choices", only: [:index] do 
    ul
      li link_to "Companies", admin_companies_path
      hr
      li link_to "Dashboard", admin_dashboard_path
  end

#
# C O N T E X T -- Places you can go
#
  sidebar "Current Choices", only: [:show, :edit] do 
    ul
      status_tag('Now you can:')
      hr
    # li link_to "Manage people for #{person.company.name}", admin_company_people_path( company )     
      hr
      status_tag('Other things you can do:')
      hr
      li link_to "Visit the Dashboard", admin_dashboard_path
      li link_to "Manage Conditions", admin_conditions_path
      li link_to "Manage Materials", admin_materials_path
      li link_to "Manage Tip Sites", admin_tips_path
  end
  
  index do |person|
    
    selectable_column

    column "Name (click for details)", :sortable => 'name' do |person|
      link_to "#{person.display_name}", admin_company_person_path(person.company, person)
    end
  
    column :title
    column :company
    column :active
    column :available
    column :OK_to_contact
    column :identifiers
    column :address
    column :permits
    
  
    
=begin
    @addressables = person.addresses
      if @addressables.present?
        h5 "Address: #{@addressables.first.street_address},  " + "\n#{@addressables.first.city},  \nMap reference: #{@addressables.first.map_reference}" #person.addresses
      else
        h5 status_tag('No address available')
      end
=end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Person Details" do

      f.input :first_name,
              :hint        => AdminConstants::ADMIN_PERSON_FIRST_NAME_HINT,
              :placeholder => AdminConstants::ADMIN_PERSON_FIRST_NAME_PLACEHOLDER

      f.input :last_name,
              :hint        => AdminConstants::ADMIN_PERSON_LAST_NAME_HINT,
              :placeholder => AdminConstants::ADMIN_PERSON_LAST_NAME_PLACEHOLDER
      
      f.input :title,
              :hint        => AdminConstants::ADMIN_PERSON_TITLE_HINT,
              :placeholder => AdminConstants::ADMIN_PERSON_TITLE_PLACEHOLDER 
      
      f.input :active, 
              :as => :radio
    end

    f.inputs "Availability" do
      f.input :available, 
              :as => :radio
      f.input :available_on, 
              :as => :date_picker
    end

    f.inputs do
      f.has_many :addresses, heading: 'Addresses', allow_destroy: true do |f|
        f.input :street_address
        f.input :city
        f.input :state
        f.input :post_code
        f.input :map_reference
      end
    end

    f.inputs do
      f.has_many :identifiers, heading: 'Rollodex', allow_destroy: true do |f|
        f.input :name, 
                :collection => AdminConstants::ADMIN_IDENTIFIER_NAME_COLLECTION,
                :label      => AdminConstants::ADMIN_IDENTIFIER_NAME_LABEL,
                :hint       => AdminConstants::ADMIN_IDENTIFIER_NAME_HINT

        f.input :value,
                :label       => AdminConstants::ADMIN_IDENTIFIER_VALUE_LABEL,
                :hint        => AdminConstants::ADMIN_IDENTIFIER_VALUE_HINT,
                :placeholder => AdminConstants:: ADMIN_IDENTIFIER_VALUE_PLACEHOLDER

        f.input :rank, 
                :collection => %w[1 2 3 4 5 6 7 8 9],
                :label       => AdminConstants::ADMIN_IDENTIFIER_RANK_LABEL,
                :hint        => AdminConstants::ADMIN_IDENTIFIER_RANK_HINT,
                :placeholder => AdminConstants::ADMIN_IDENTIFIER_RANK_PLACEHOLDER 
      end
    end
 

# [TODO] Valid_from and valid_to not displayed 
# [TODO] Add labels, hints and placeholders
    f.inputs do 
      f.has_many :permits, heading: 'Permits', allow_destroy: true do |p|

        p.input :name,
                label:       AdminConstants::ADMIN_PERMIT_NAME_LABEL,
                hint:        AdminConstants::ADMIN_PERMIT_NAME_HINT,
                placeholder: AdminConstants::ADMIN_PERMIT_NAME_PLACEHOLDER 

        p.input :description
        p.input :jurisdiction
        p.input :basis
        p.input :permanent
        p.input :valid_from
        p.input :valid_to
      end
    end
 
    f.actions

  end


  show :title => 'Personal Details' do
    h3 person.full_name
    panel "Context" do
      attributes_table_for(person) do
        row :company
        row :title
        row ("Address") { person.addresses }
        row ("Rollodex") { person.identifiers }
      end
    end

    panel 'Availability' do
      attributes_table_for(person) do
        row ("active") { status_tag (person.active ? "YES" : "No"), (person.active ? :ok : :error) }
        row("Available") { status_tag (person.available ? "YES" : "No"), (person.available ? :ok : :error) }
        unless person.available
          row( "When #{person.display_name} will be available") {person.available_on}
        end
        row("OK_to_contact") { status_tag (person.OK_to_contact ? "YES" : "No"), (person.OK_to_contact ? :ok : :error) }
      end
    end
 
    [TODO] -- this is sloppy given way dates are assumed to be present based on name !nil.
    panel 'Permits & Qualifications' do
      attributes_table_for(person) do
         person.permits.all.each do |permit|
            unless permit.name.nil?
              row("#{permit.name}") {  permit.description + "\t Valid From:  " +
                (permit.valid_from.nil? ? 'unknown' : permit.valid_from.to_date.to_s) + ', ' + "\t Valid Until: " +
                (permit.valid_to.nil?   ? 'unknown' : permit.valid_to.to_date.to_s)           
              }
            end
        end
      end
    end

=begin
    # Removed as was based on Certificates has_many Certs belongs_to Certificates
    # Cert is polymorphic
    # certifiable_id == who owns it, e.g. Person, Company, Vehicle...
    # certificate_id == what is it, e.g. Driving License, Birth Certificate...
    # Each instance makes the Certificate specific, for example 'this' vehicle's insurance policy
    panel 'Certifications & Qualifications' do
      attributes_table_for(person) do
        unless person.certs.any?
          h4 'None'
        else
          certs = person.certs.all.each do |cert|
            row("#{cert.certificate.name}") {  cert.certificate.description +
            (cert.active ? ' Current '  : ' Lapsed or pending').to_s + ', ' +
            (cert.permanent ? ' Permanent ' : ' Temporary ').to_s + ','     +  
            ' Serial_number: ' + cert.serial_number }
          end
        end
      end
    end
=end
    active_admin_comments
  end

end
