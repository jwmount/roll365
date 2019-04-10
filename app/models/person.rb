class Person < ApplicationRecord


  belongs_to :company

  has_many :dockets, :dependent => :destroy
  validates_associated :dockets

  has_many :engagements, :dependent => :destroy
  validates_associated :engagements

  #has_many :reservations, :dependent => :destroy
  has_and_belongs_to_many :schedules
  validates_associated :schedules
  
  #
  # P O L Y M O R P H I C  A S S O C I A T I O N S
  #
  has_many  :addresses, 
            :as           => :addressable, 
            :autosave     => true
  validates_associated :addresses

  has_many :permits, 
           :as            => :permitable, 
           :autosave      => true
  validates_associated :permits

  has_many :identifiers, 
           :as            => :identifiable, 
           :autosave      => true
  validates_associated :identifiers

  # NESTING           
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :permits
  accepts_nested_attributes_for :identifiers
  
  # Update scopes for rails 5.2.2
  # scope :alphabetically, -> { order: ("last_name DESC") }
  scope :post_code,      -> { where(certifiable_type: "Person")}
  
  # delegate :post_code, :to => :address

#
# V A L I D A T I O N S
#
#  validates_presence_of :last_name

#
# D E F A U L T S
#

#
# Roles people can be in
# [TODO]. Move into Role model or remove altogether
#
  roles_list = %w[ admin bookkeeper driver management operations sales superadmin visitor]

#
# Validations
#
  after_initialize :defaults
  def defaults
     unless persisted?
       self.active           ||= true
       self.OK_to_contact    ||= true
       self.available        ||= true
       self.OK_to_contact    ||= true
       self.available_on     ||= Date.today + 1.day
    end
  end

#
# class methods
#

  def display_name
    full_name
  end
  
  def full_name
    [self.first_name, self.last_name].compact.join ' '
  end
 
  def company_name
    @company = Company.find(self.company_id)
    @company.name
  end

  def people
    byebug
    @staff = self.people_path
  end
 #
 # Address(es)
 #   
  def address
    @address = Address.where("addressable_id = ? AND addressable_type = ?", self.id, 'Company').limit(1)
    unless @address.blank?
      address = "#{@address[0].street_address},  #{@address[0].city} #{@address[0].state} #{@address[0].post_code} "
    else
      'Empty'
    end
  end

end
