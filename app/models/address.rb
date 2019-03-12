class Address < ApplicationRecord
  belongs_to :company, polymorphic: true
  belongs_to :person, polymorphic: true
  belongs_to :identifier, polymorphic: true
  belongs_to :cert, polymorphic: true
  belongs_to :requirement, polymorphic: true
end
