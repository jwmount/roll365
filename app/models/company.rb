class Company < ApplicationRecord


#
# A S S O C I A T I O N S    A S S O C I A T I O N S    A S S O C I A T I O N S   
#
  has_many :people, :dependent => :destroy
  validates_associated :people

  has_many :equipment, :dependent => :destroy
  validates_associated :equipment
           
  # polymorphs
  has_many  :addresses,
            :as         => :addressable,
            :autosave   => true
  validates_associated :addresses

  
  has_many :identifiers, 
           :as         => :identifiable, 
           :autosave   => true, 
           :dependent  => :destroy,
           :inverse_of => :identifiable
  validates_associated :identifiers

  #
  # REQUIRED for nestd forms which we are NOT using
  #
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :identifiers, allow_destroy: true
  accepts_nested_attributes_for :people, allow_destroy: true
 

  #
  # V A L I D A T I O N S   O N  C L A S S  O B J E C T   V A L I D A T I O N S   O N  C L A S S  O B J E C T. 
  #
  validates_presence_of :name
  validates_uniqueness_of :name

  # conditional validations -- bookkeeping_number
  # note that :if clause is a hash and NOT a comparison
  # bookkeeping_number number must be unique 5 digits if given, otherwise may be blank.
  with_options :if => :is_bookkeeping_number? do |c|
     c.validates_presence_of :bookkeeping_number, 
     :numericality => { :only_integer => true, 
                        :greater_than_or_equal_to => AdminConstants::ADMIN_COMPANY_BOOKKEEPING_NO_BASE,
                        :less_than_or_equal_to => AdminConstants::ADMIN_COMPANY_BOOKKEEPING_NO_MAX,
                        :equal_to => AdminConstants::ADMIN_COMPANY_BOOKKEEPING_NO_DEFAULT
                      }
  end

  
  #
  # S C O P E S
  #

  #kaminari
  # [TODO] remove this, is part of Kaminari paginates_per  10
  
  #
  # D E F A U L T S 
  #
  after_initialize :defaults

  def defaults
     unless persisted?
      
       self.active             ||= true
       self.bookkeeping_number ||= '(Please edit.)'
       self.credit_terms       ||= '(Please edit.)'
       self.line_of_business   ||= '(Please edit.)'
       self.name               ||= '(Please edit.)'
       self.PO_required        ||= true
       self.url                ||= '(Please edit.)'
   
     end
  end
  
  # [TODO] based on ENV['LICENSEE', 'unused or the name']
  def licensee
    'Not licensed'
  end

  def is_bookkeeping_number?
    !self.bookkeeping_number.blank?
  end
  
  def display_name
    name = licensee ? self.name + ' (Licensee)' : self.name
  end

  def show_people(company)
    'contact'
  end

  #
  # originally returned integer to be stored, string is easier to search on
  #
  def display_credit_terms (terms)
    cr = ['None', 'Week', 'Fortnight', 'Month', 'Same Day', 'On Delivery']
    #terms.nil? ? cr[0] : cr[terms]
  end

  #
  # Determin id of address if there is one, nil if none
  # Note that this is a relation so extracting address.id is based on that
  #
  def has_address? (company = 'Company')
    (Address.where("addressable_id = ? AND addressable_type = ?", self.id, company).limit(1)).ids[0]
  end

  #
  # Do we have City, State ?
  # Return as string, otherwise return nil with id of address record (for use in Linked_to "Please edit", edit_address_path)
  # true means yes, prompt for city, state is needed, false means second returned value is correct.
  def display_city
    @address = Address.where("addressable_id = ? AND addressable_type = ?", self.id, 'Company').limit(1).take
    
    @address.nil? ? 'Please edit' : @address.city + ', ' + @address.state
  end

  def display_address
    @address = Address.where("addressable_id = ? AND addressable_type = ?", self.id, 'Company').limit(1)
    unless @address.blank?
      address = "#{@address[0].street_address},  #{@address[0].city} #{@address[0].state} #{@address[0].post_code} " 
    else
      'No address available.'
    end
  end

  def map_reference
    'Empty'
  end
  #def map_reference
  #  @address = self.address.limit(1)
    #@address = Address.where("addressable_id = ? AND addressable_type = ?", self.id, 'Company').limit(1)
  #  unless @address.nil?
  #    map_reference = "#{@address[0].map_reference}"
  #  else
  #    map_reference = 'Empty'
  #  end
  #end  
    
  def equipment_list
    list = ""
    self.equipment.each do |e|
      list << "#{e.name}, "
    end
    return nil if list.all.empty?  
    list.rstrip.chop!
  end
  
  def rollodex
    list = ""
    self.identifiers.order(:rank).each do |i|
      list << "#{i.name}: #{i.value}  "
    end      
    list
  end


end
