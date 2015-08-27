class Carer < ActiveRecord::Base
  has_many :carer_to_children
  has_many :children, through: :carer_to_children
  has_many :carer_to_meet
  has_many :meet, through: :carer_to_meet
  belongs_to :how_heard

  scope :search, ->(text) { where('upper(name) like ?', '%'+text.upcase+'%') }
  scope :recent, ->{ eager_load(:meet).where('meet_date > :recent or carers.created_at > :recent', { recent: (Date.today - 6.months) }) }
  scope :in_order, ->{ order("name") }
  validates :name, :phone, presence: true

end
