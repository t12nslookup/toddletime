class Child < ActiveRecord::Base
  has_many :carer_to_children
  has_many :carers, through: :carer_to_children
  has_many :child_to_meet
  has_many :meet, through: :child_to_meet

  validates :name, presence: true,
                   length: { minimum: 5 }
  validates :registered_date, presence: true

  scope :search, ->(text) { where('upper(name) like ?', '%' + text.upcase + '%') }
  # scope :recent, ->{ joins(:meet).merge(Meet.recent) }
  scope :recent, -> { eager_load(:meet).where('meet_date > :recent or children.created_at > :recent', { recent: (Date.today - 6.months) }) }
  scope :in_order, -> { order('name') }
  scope :with_condition, -> { where.not( medical_conditions: ['', 'none'] ) }

end
