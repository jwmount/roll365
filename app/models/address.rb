class Address < ApplicationRecord


  belongs_to :addressable, polymorphic: true

  def display_name (parent_name: self)
    
    case self.addressable_type

      when 'Company'
        @company = Company.find( self.addressable_id )
        @company.name
  
      when 'Project'
        @project = Project.find( self.addressable_id )
        @project.name
  
      when 'Person'
        @person = Person.find( self.addressable_id )
        @person.full_name
  
      else
        "Unknown type"
    end
    
  end

end
