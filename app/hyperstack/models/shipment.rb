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
       self.tracking_id      ||= 'not assigned'
       self.ship_from        ||= 'open'
       self.ship_to          ||= 'open'
       self.pickup           ||= 'open'
       self.deadline         ||= 'open'
       self.cargo            ||= 'what is in the shipment'
       self.utilization      ||= 'FL, Full Load, 100%'
       self.ontime           ||= true
       self.completed        ||= false
       self.delayed          ||= false
       self.quote_basis      ||= 'open'
       self.quote_complete   ||= 'open'
    end
  end

  SEARCHABLE_COLUMNS = %i[tracking_id ship_from ship_to]
  scope :search_for, (
    lambda do |search_string, order = 'ASC', page = nil, per_page = 10|
      # ransack may not be what you want for a general search anywhere function
      # but here is an example
      q = {:"#{SEARCHABLE_COLUMNS.join("_or_")}_cont" => search_string}
      r = ransack(q).result.order(tracking_id: order)
      r = r.paginate(page: page, per_page: per_page) if page
      r
    end
  )
  
  def status_list(s)
    status_list = [['Open', 0], ['Closed', 1],['Suspended - Cannot be changed', 2]]
    return status_list[s][0]
  end

  scope :ontime, -> { where(ontime: true) }
  scope :completed, -> { where(completed: false) }
  scope :delayed, -> { where(delayed: false)}

end

