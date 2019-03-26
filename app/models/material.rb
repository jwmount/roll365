class Material < ApplicationRecord

  has_many :requirements, :dependent => :destroy
  has_many :permits, :through => :requirements
  has_many :solutions, :dependent => :destroy


end
