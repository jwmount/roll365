class Permit < ApplicationRecord
  
  belongs_to :permitable, polymorphic: true
  

  # D E F A U L T  V A L U E S  
  after_initialize :defaults
  
  def defaults
    unless persisted?
      self.basis ||= 'unknown'
      self.description ||= 'Permits and Licenses'
      self.fee ||= 0.00
      self.for_company||= false
      self.for_equipment ||= false
      self.for_location ||= false
      self.for_person ||= false
      self.issuer ||= 'unknown'
      self.jurisdiction ||= 'unknown'
      self.name ||= 'unknown'
      self.permanent ||= false
      self.required ||= false
      self.valid_from ||= DateTime.now
      self.valid_to ||= DateTime.now
    end
  end

end

