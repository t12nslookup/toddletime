class Meet < ActiveRecord::Base
  has_many :leader_to_meet
  has_many :jobs, through: :leader_to_meet
  has_many :leaders, through: :leader_to_meet
  has_many :child_to_meet
  has_many :carer_to_meet
  has_many :children, through: :child_to_meet
  has_many :carers, through: :carer_to_meet
  belongs_to :meet_type

  scope :in_order, ->{ order("meet_date") }

  validates :meet_date, presence: true, uniqueness: true
end
