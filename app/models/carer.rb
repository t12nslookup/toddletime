class Carer < ActiveRecord::Base
  has_many :carer_to_children
  has_many :children, through: :carer_to_children
  has_many :carer_to_meet
  has_many :meet, through: :carer_to_meet

  scope :search, ->(text) { where('upper(name) like ?', '%'+text.upcase+'%') }
  scope :in_order, ->{ order("name") }
  validates :name, :phone, presence: true

end
