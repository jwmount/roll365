class Permit < ApplicationRecord
  
  belongs_to :permitable, polymorphic: true
  

  # D E F A U L T  V A L U E S  
    after_initialize :defaults
  
      def defaults
        unless persisted?
          self.name ||= 'unknown'
          self.description ||= 'Permits and Licenses'
          self.issuer ||= 'DOT'
        end
      end

end
