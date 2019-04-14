class Material < ApplicationRecord

  has_many :requirements, :dependent => :destroy
  has_many :permits, :through => :requirements
 #pendent => :destroy

  #kaminari
  paginates_per  10
    
end
