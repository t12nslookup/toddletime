class Carer < ActiveRecord::Base
  has_many :carer_to_children
  has_many :children, through: :carer_to_children

  scope :in_order, ->{ order("name") }
  validates :name, :phone, presence: true

end
