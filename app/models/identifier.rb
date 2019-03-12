class Identifier < ApplicationRecord

# A S S O C I A T I O N    A S S O C I A T I O N    A S S O C I A T I O N    A S S O C I A T I O N   
  belongs_to :company
  validates_associated :companies

  belongs_to :person
  validates_associated :people

  # removed, prevents @contact.save operations if present
  #  validates_presence_of :identifiable_id, :identifiable_type, :name, :value
  # trial:  see if having all defaults handles this.  Cleaner than trinary tests in people.rb etc.
  # this seems to be fine so long as there are default values enforced.
  validates_presence_of :name, :value
  validates :rank, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than => 10}
   
  # scope :ranked, -> { where(rank: "DSC") }
  
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

  end