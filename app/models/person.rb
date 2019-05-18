class Person < ApplicationRecord


  belongs_to :company

  #
  # P O L Y M O R P H I C  A S S O C I A T I O N S
  #
  has_many  :addresses, 
            :as           => :addressable, 
            :autosave     => true,
            :inverse_of   => :addressable
  #validates_associated :addresses
  accepts_nested_attributes_for :addresses, reject_if: lambda {|attributes| attributes['kind'].blank?}

  has_many :identifiers, 
           :as            => :identifiable, 
           :autosave      => true
  validates_associated :identifiers


  # NESTING           
  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :identifiers
  

  #
  # V A L I D A T I O N S
  #
  # No nameless'ness allowed
  validates_presence_of :first_name
  validates_presence_of :last_name

#
# D E F A U L T S
#

#
# Roles people can be in
# [TODO]. Move into Role model or remove altogether
#
  roles_list = %w[ admin broker driver management operations sales superadmin visitor]

#
# Validations
#
  after_initialize :defaults
  def defaults
     unless persisted?
       self.first_name       ||= 'first name'
       self.last_name        ||= 'last name'
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
    @staff = self.people_path
  end
 #
 # Address(es)
 #   
  def display_address
    @address = Address.where("addressable_id = ? AND addressable_type = ?", self.id, 'Person').limit(1)
    #@address = Address.where("addressable_id = ? AND addressable_type = ?", self.id, 'Company').limit(1)
    unless @address.blank?
      address = "#{@address[0].street_address},  #{@address[0].city}, #{@address[0].state} #{@address[0].post_code} "
    else
      link_to "New Address", new_person_address_path(@person)
    end
  end

end
