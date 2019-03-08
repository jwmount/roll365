class Role < ApplicationRecord
  
  has_many :admin_users
  #has_and_belongs_to_many :adminUsers
  
    # scope :alphabetically, order("name ASC")

  class << self
    def by_name
      order("name ASC")
    end
  end
end
