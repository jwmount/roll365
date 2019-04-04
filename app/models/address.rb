class Address < ApplicationRecord


  belongs_to :addressable, polymorphic: true

  scope :corporate,      -> { where(addressable_type: 'Company') }
  scope :project,        -> { where(addressable_type: 'Project') }
  scope :person,         -> { where(addressable_type: 'Person') }

end
