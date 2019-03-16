class Requirement < ApplicationRecord
  
  belongs_to :requireable, polymorphic: true

end
