class Shipment < ApplicationRecord

#
# Validations
#
  validates_presence_of :tracking_id
  validates_uniqueness_of :tracking_id #, :scope => [:question_id]
#
# Initializations
#
  after_initialize :defaults
  def defaults
     unless persisted?
       self.ship_from        ||= 'open'
       self.ship_to          ||= 'open'
       self.pickup           ||= 'open'
       self.deadline         ||= 'open'
       self.cargo            ||= 'what is in the shipment'
       self.utilization      ||= 'FL, Full Load, 100%'
       self.quote_basis      ||= 'open'
       self.quote_complete   ||= 'open'
    end
  end



  def status_list(s)
    status_list = [['Open', 0], ['Closed', 1],['Suspended - Cannot be changed', 2]]
    return status_list[s][0]
  end

end

