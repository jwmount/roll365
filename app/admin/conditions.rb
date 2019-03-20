ActiveAdmin.register Condition do

  permit_params  :name, :verbiage, :indication, :status, :approved, :change_approved_by, :change_approved_at

  menu parent: "Compliance"

  filter :name
  filter :status
  filter :verbiage
  filter :indication

  
  index do
    column :name do |condition|
      link_to condition.name, admin_condition_path(condition)
    end

    column :verbiage

    column :indication

    column :approved do |condition|
      status_tag (condition.approved ? "YES" : "No"), (condition.approved ? :ok : :error)
    end

  end

    
  form :title => :name do |f|

    f.semantic_errors *f.object.errors.keys

    f.inputs do |condition|
      f.input :name, 
              :required => true, 
              :input_html => {:class => "large"},
              :placeholder => AdminConstants::ADMIN_CONDITIONS_NAME_PLACEHOLDER
              
      f.input :verbiage, 
              :required => true,
              :placeholder => AdminConstants::ADMIN_CONDITIONS_VERBIAGE_PLACEHOLDER
              
      f.input :indication, 
              :required => true,
              :placeholder => AdminConstants::ADMIN_CONDITIONS_INDICATION_PLACEHOLDER
      f.input :approved
    end

    f.actions
  end


  show :title => 'Condition' do
    h3 condition.name
    attributes_table_for(condition) do
      rows :name, :verbiage, :indication
      row("Approved") { status_tag (condition.approved ? "YES" : "No"), (condition.approved ? :ok : :error) }        
    end
    active_admin_comments
  end

end
