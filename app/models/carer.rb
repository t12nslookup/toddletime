class Carer < ActiveRecord::Base
  has_many :carer_to_child
  has_many :child, through: :carer_to_child
end
