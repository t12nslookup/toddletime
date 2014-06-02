class Child < ActiveRecord::Base
  has_many :carer_to_children
  has_many :carers, through: :carer_to_children
  has_many :child_to_session
  has_many :session, through: :child_to_session

  validates :name, presence: true,
                   length: { minimum: 5 }


  scope :search, ->(text) { where('upper(name) like ?', '%'+text.upcase+'%') }
  scope :in_order, ->{ order("name") }

end
