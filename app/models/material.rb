class Material < ApplicationRecord

  #
  # used with Projects, Solutions, ??
  #
  belongs_to :materialable, polymorphic: true

  
  #kaminari
  paginates_per  10
    
end
