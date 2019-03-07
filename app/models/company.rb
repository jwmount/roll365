class Company < ApplicationRecord

  has_many :people, 
           :dependent => :destroy
  has_many :equipment, 
           :dependent => :destroy
  has_many :projects, 
           :dependent => :destroy
  has_many :reservations
  # We do not use :dependent => :destroy as tips survive company owners.  OK?
  has_many :tips

  # polymorphs
  has_many  :addresses, 
            :as        => :addressable, 
            :autosave  => true, 
            :dependent => :destroy

  has_many :certs, 
           :as        => :certifiable, 
           :autosave  => true, 
           :dependent => :destroy

  has_many :identifiers, 
           :as        => :identifiable, 
           :autosave  => true, 
           :dependent => :destroy

  accepts_nested_attributes_for :addresses
  accepts_nested_attributes_for :certs
  accepts_nested_attributes_for :identifiers

end
