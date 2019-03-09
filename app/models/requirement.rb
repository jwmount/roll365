class Requirement < ApplicationRecord
  
  belongs_to :certificate, polymorphic: true

end
