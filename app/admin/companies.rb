ActiveAdmin.register Company do

# 
# F I L T E R S    F I L T E R S    F I L T E R S    F I L T E R S   
# Sideware limited to named filter, otherwise all fields of model.
# All fields has its merits, e.g. find by date range
#
# filter works, but why limit query components?
# filter :name


#
# I N D E X / L I S T  C O N T E X T
#
  sidebar "Companies Context", only: [:index] do 
    ul
      li link_to "Dashboard", admin_dashboard_path
      li link_to "People", admin_people_path
      
  end

  sidebar "Company Details", only: [:show, :edit] do 
    ul
      status_tag('Now you can:')

    # li link_to 'Do Projects', admin_company_projects_path( company )           
      hr
      status_tag('Work on Company Details:')
       li link_to( "Equipment", admin_company_equipment_index_path( company ) )
       li link_to( "People", admin_company_people_path( company ) )
       li link_to( "Projects", admin_company_projects_path( company ) )
      hr
      li link_to "Dashboard", admin_dashboard_path
  end


#
# Partials do APPEAR TO NOT WORK in rails 5.2.2
# generates:  Missing partial admin/companies/_company.html.haml
# but path should be admin/app/views/companies/_company.html.haml
#

  index do

    selectable_column

    column "Name (click for details)", :sortable => 'name' do |company|
      company
      # company.identifiers.map(&:name).join(',') unless company.identifiers.empty?
      # company.addresses.map(&:street_address).join(',') unless company.address.empty?

    end

    column :projects do |company|
      if company.projects.count > 0
        link_to "Projects (#{company.projects.count.to_s})", admin_company_projects_path( company )
      else
        link_to "New Project", new_admin_company_project_path( company )
      end
    end

    column :equipment do |company|
      if company.equipment.size > 0 
        link_to "Equipment (#{company.equipment.count.to_s})", admin_company_equipment_index_path( company )
      else
        link_to "New equipment", new_admin_company_equipment_path(company)
      end
    end
    
    column :people do |company|
      if company.people.count > 0
        link_to "People (#{company.people.count.to_s})", admin_company_people_path( company )
      else
        link_to "New person", new_admin_company_person_path(company)
      end
    end
    
    column "Bookkeeping No." do |company|
      company.bookkeeping_number
    end

    column "Credit Terms" do |company|
      company.credit_terms
    end

    column "PO" + " required" do |company|
      status_tag (company.PO_required ? "YES" : "No"), (company.PO_required ? :ok : :error)
    end      
    column :active do |company|
      status_tag (company.active ? "YES" : "No"), (company.active ? :ok : :error)
      end      
  end


  form do |f|
    f.semantic_errors *f.object.errors.keys
    #error_panel f
  
    
    f.inputs "Company Details" do

      f.input :name, 
              :hint         => AdminConstants::ADMIN_COMPANY_NAME_HINT,
              :placeholder  => AdminConstants::ADMIN_COMPANY_NAME_PLACEHOLDER

      f.input :line_of_business,
              :hint         => AdminConstants::ADMIN_COMPANY_LINE_OF_BUSINESS_HINT

      f.input :url,
              :label        => AdminConstants::ADMIN_COMPANY_URL_LABEL,
              :placeholder  => AdminConstants::ADMIN_COMPANY_URL_PLACEHOLDER,
              :hint         => AdminConstants::ADMIN_COMPANY_URL_HINT

      f.input :bookkeeping_number,  
              :as          => :string, 
              :hint        => AdminConstants::ADMIN_COMPANY_BOOKKEEPING_NO_HINT,
              :placeholder => AdminConstants::ADMIN_COMPANY_BOOKKEEPING_NO_DEFAULT

      f.input :PO_required,  
              :as          => :radio, 
              :label       => AdminConstants::ADMIN_C0MPANY_PO_REQUIRED_LABEL

      f.input :credit_terms, 
              :label       => AdminConstants::ADMIN_C0MPANY_CREDIT_TERMS_LABEL,
              :hint        => AdminConstants::ADMIN_C0MPANY_CREDIT_TERMS_HINT,
              :placeholder => AdminConstants::ADMIN_C0MPANY_CREDIT_TERMS_PLACEHOLDER

      f.input :active, 
              :as => :radio
    end

    f.inputs "Addresses" do
      f.has_many :addresses do |a|
          a.input :street_address
          a.input :city
          a.input :state
          a.input :post_code
          a.input :map_reference
      end
    end
    
    f.inputs "Rollodex Items for Company" do
      f.has_many :identifiers do |f|

          f.input :name, 
                  :collection  => %w[Mobile Office Truck Pager FAX Email Skype SMS Twitter URL],
                  :label       => AdminConstants::ADMIN_IDENTIFIER_NAME_LABEL,
                  :hint        => AdminConstants::ADMIN_IDENTIFIER_NAME_HINT

          f.input :value,
                  :label       => AdminConstants::ADMIN_IDENTIFIER_VALUE_LABEL,
                  :hint        => AdminConstants::ADMIN_IDENTIFIER_VALUE_HINT,
                  :placeholder => AdminConstants::ADMIN_IDENTIFIER_VALUE_PLACEHOLDER

          f.input :rank, 
                  :collection  => %w[1 2 3 4 5 6 7 8 9],
                  :label       => AdminConstants::ADMIN_IDENTIFIER_RANK_LABEL,
                  :hint        => AdminConstants::ADMIN_IDENTIFIER_RANK_HINT,
                  :placeholder => AdminConstants::ADMIN_IDENTIFIER_RANK_PLACEHOLDER
      end
    end
    
    f.inputs do
      f.has_many :certs do |f|

        f.input :certificate,
                :collection => Certs.where({:for_company => true}),
                :include_blank => false

        f.input :active

        f.input :expires_on, 
                :as => :date_picker,
                :hint => AdminConstants::ADMIN_CERT_EXPIRES_ON_HINT

        f.input :permanent

        f.input :serial_number, 
                :hint => AdminConstants::ADMIN_CERT_SERIAL_NUMBER_HINT

      end
    end
    f.actions
  end


  show :title => :display_name do
    attributes_table do
      row :name
      row :line_of_business
      row ("Rollodex") { render company.identifiers}
      row ("Web Site") { link_to "#{company.url}", href="http://#{company.url}", target: '_blank' }
      row :credit_terms
      row("PO_required") { status_tag (company.PO_required ? "YES" : "No"), (company.PO_required ? :ok : :error) }        
      row("active") { status_tag (company.active ? "YES" : "No"), (company.active ? :ok : :error) }
      row :bookkeeping_number
      row ("People") {company.people}
      row ("Projects") {company.projects}
      row ("Equipment") {company.equipment}
      row ("Address")  {company.addresses}
      row ("Certifications") {company.certs}
    end

    active_admin_comments

  end


# 
# P U S H  B U T T O N S
#
  # ACTIVATE
  # Activate sets the company status to Active (true).  Does not toggle.
  # 
  action_item :only => [:edit, :show] do
    link_to 'Activate', activate_admin_company_path( company )
  end

  member_action :activate, :method => :get do
    company = Company.find(params[:id])
    company.active = true
    company.save!
    flash[:notice] = AdminConstants::ADMIN_COMPANY_ACTIVE
    redirect_to admin_company_path( company )
  end

# 
# W H I T E  L I S T.  W H I T E  L I S T.  W H I T E  L I S T.  W H I T E  L I S T.  W H I T E  L I S T. 
#
  permit_params :name, :credit_terms, :PO_required, :active, :bookkeeping_number, :line_of_business, :url, :licensee

end
