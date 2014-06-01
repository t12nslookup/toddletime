class Carer < ActiveRecord::Base
  has_many :carer_to_child
  has_many :children, through: :carer_to_child
end
