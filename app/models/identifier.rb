class Identifier < ApplicationRecord

# A S S O C I A T I O N    A S S O C I A T I O N    A S S O C I A T I O N    A S S O C I A T I O N   
  

  belongs_to :identifiable, polymorphic: true

  validates_presence_of :name, :value, :identifiable_type, :identifiable_id
  validates :rank, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than => 10}
   


  # D E F A U L T  V A L U E S  
    after_initialize :defaults
  
      def defaults
        unless persisted?
          self.name ||= 'Please edit'
          self.rank ||= 9
          self.value ||= 'Please edit'
        end
      end

#
# Get and display parent name of polymorphic Indentifier
#
# On Person records name is not given  so use first and last names 
  def display_parent_name
    begin
      @parent_name = "#{self.identifiable_type}".constantize.find(self.identifiable_id).name 
    rescue
      @parent_name = "#{self.identifiable_type}".constantize.find(self.identifiable_id).first_name 
      @parent_name += " "
      @parent_name += "#{self.identifiable_type}".constantize.find(self.identifiable_id).last_name 
    end

  end

  
=begin
  def display_name (parent_name: self)
    
    case self.identifiable_type

      when 'Company'
        @company = Company.find( self.identifiable_id )
        @company.name
  
      when 'Project'
        @project = Project.find( self.identifiable_id )
        @project.name
  
      when 'Person'
        @person = Person.find( self.identifiable_id )
        @person.full_name
  
      else
        "Unknown type"
    end
    
  end
=end

end
