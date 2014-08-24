class Meet < ActiveRecord::Base
  has_many :leader_to_meets
  has_many :jobs, through: :leader_to_meets
  has_many :leaders, through: :leader_to_meets
  has_many :child_to_meets
  has_many :carer_to_meets
  has_many :children, through: :child_to_meets
  has_many :carers, through: :carer_to_meets
  belongs_to :meet_type

  scope :in_order, ->{ order("meet_date") }

  scope :find_historic, ->{ where('meet_date < :today', {today: Date.today.to_s}) }
  scope :find_future, ->{ where('meet_date >= :today', {today: Date.today.to_s}) }

  validates :meet_date, presence: true, uniqueness: true
  accepts_nested_attributes_for :leader_to_meets

end
