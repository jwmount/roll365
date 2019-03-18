class Trial < ApplicationRecord
  belongs_to :trialable, polymorphic: true
  belongs_to :company, polymorphic: true
  belongs_to :person, polymorphic: true
end
