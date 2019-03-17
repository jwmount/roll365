class Certificate < ApplicationRecord

 
#  has_many :certs,
#           :as        => :certifiable, 
#           :autosave  => true, 
#           :dependent => :destroy
#  validates_associated :certs  
  
  validates :name,          :presence => true
  validates :active,        :presence => true
  
  def display_name
    self.name
  end


end
