class Identifier < ApplicationRecord

# A S S O C I A T I O N    A S S O C I A T I O N    A S S O C I A T I O N    A S S O C I A T I O N   
  

  belongs_to :identifiable, polymorphic: true

  validates_presence_of :name, :value
  validates :rank, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than => 10}
   
  # this doesn't seem to work?  refers to line below
  # scope :ranked, order("rank DSC")

  # D E F A U L T  V A L U E S  
    after_initialize :defaults
  
      def defaults
        unless persisted?
          self.name ||= 'unknown'
          self.rank ||= 1
          self.value ||= 'unknown'
        end
      end


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

end
