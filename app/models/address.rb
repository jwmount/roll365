class Address < ApplicationRecord

#
# A S S O C I A T I O N S    A S S O C I A T I O N S    A S S O C I A T I O N S   
#
  belongs_to :company, polymorphic: true

end
