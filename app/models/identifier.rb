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


end
