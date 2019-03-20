ActiveAdmin.register Person do

  belongs_to :company
  permit_params :company_id, :first_name, :last_name, :title, :available, :available_on, :OK_to_contact, :active,

                companies_attributes: [:name, :credit_terms, :PO_required, :active, :bookkeeping_number, :line_of_business, :url, :licensee],

                addresses_attributes: [ :id, :addressable_id, :addressable_type, :street_address, :city, :state, :post_code, :map_reference, :longitude, :latitude],
                
                identifiers_attributes: [:id, :identifiable_id, :identifiable_type, :name, :value, :rank],
                
                permits_attributes: [:id, :permitable_id, :permitable_type, :name, :description, :issuer, :jurisdiction, 
                          :basis, :required, :for_person, :for_company, :for_equipment, :for_location, :permanent,
                          :valid_from, :valid_to]
  
# menu :parent => "Companies"

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
  
  index do

    selectable_column
    column :name do |person|

      h4 link_to "#{person.display_name}", new_admin_company_person_path(person.company_id)
      h5 link_to "Contact: #{person.company.name}", admin_company_path(person.company_id)
      @identifiers = person.identifiers.order(:rank)
      render @identifiers
      
      @addresses = person.addresses
      h5 person.addresses
      

    end

    column :title
    
    column :available do |person|
      status_tag (person.available ? "YES" : "No"), (person.available ? :ok : :error)
    end

    column :OK_to_contact  do |person|
      status_tag (person.OK_to_contact ? "YES" : "No"), (person.OK_to_contact ? :ok : :error)
    end

    column :active  do |person|
      status_tag (person.active ? "YES" : "No"), (person.active ? :ok : :error)
    end

    column :permits do |person|
      person.permits
    end
    actions
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
=begin
# [TODO] Valid_from and valid_to not displayed 
    f.inputs do 
      f.has_many :permits, heading: 'Permits', allow_destroy: true do |p|
        p.input :name
        p.input :description
        p.input :jurisdiction
        p.input :basis
        p.input :permanent
        p.input :valid_from
        p.input :valid_to
      end
    end
=end
    f.actions

  end


  show :title => 'Personal Details' do
    h3 person.full_name
    panel "Context" do
      attributes_table_for(person) do
        row :company
        row :title
        row ("Address") { render person.addresses }
        row ("Rollodex") { render person.identifiers }
        row ("active") { status_tag (person.active ? "YES" : "No"), (person.active ? :ok : :error) }
      end
    end

    panel 'Availability' do
      attributes_table_for(person) do
        row("Available") { status_tag (person.available ? "YES" : "No"), (person.available ? :ok : :error) }
        unless person.available
          row( "When #{person.display_name} will be available") {person.available_on}
        end
        row("OK_to_contact") { status_tag (person.OK_to_contact ? "YES" : "No"), (person.OK_to_contact ? :ok : :error) }
      end
    end

    # Permit is polymorphic for Company, Person, Equipment, ?
    panel 'Permits & Qualifications' do
      attributes_table_for(person) do
        unless person.permits.any?
          h4 'None'
        else
          permits = person.permits.all.each do |permit|
            unless permit.valid_from.nil?
              h4 'No'
            else
              row ("Name") {permit.name}
              row ("Description") {permit.description}
              row ("Valid_from") {permit.valid_from}
              row ("----") #  {(permit.valid_from >= DateTime.now ? ' Current '  : ' Lapsed or pending') }
            end
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

  batch_action :enhance do |selection|
      # Do some deleting...
      selection.destroy
  end

  batch_action :destroy, :confirm => "really really sure ???you want to delete all of these?" do |selection|
      # Do some deleting...
      selection.destroy
  end


end
