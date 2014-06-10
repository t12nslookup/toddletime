class Child < ActiveRecord::Base
  has_many :carer_to_children
  has_many :carers, through: :carer_to_children
  has_many :child_to_meet
  has_many :meet, through: :child_to_meet

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates :registered_date, presence: true

  scope :search, ->(text) { where('upper(name) like ?', '%'+text.upcase+'%') }
  scope :in_order, ->{ order("name") }

end
