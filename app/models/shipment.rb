class Shipment < ApplicationRecord

#
# Validations
#
  validates_uniqueness_of :tracking_id #, :scope => [:question_id]
#
# Initializations
#
  after_initialize :defaults
  def defaults
     unless persisted?
       self.ship_from        ||= 'here'
       self.ship_to          ||= 'there'
       self.deadline         ||= 'soon'
       self.cargo            ||= 'what is'
       self.utilization      ||= 'FL, Full Load, 100%'
       self.quote_basis      ||= 'list of costs'
       self.quote_complete   ||= '$1000'
    end
  end

end

