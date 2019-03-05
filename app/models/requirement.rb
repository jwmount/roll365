class Requirement < ApplicationRecord
  belongs_to :require, polymorphic: true
end
