class ApplicationRecord < ActiveRecord::Base


  regulate_scope :all


  self.abstract_class = true

end