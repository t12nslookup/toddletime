class Meet < ActiveRecord::Base
  has_many :leader_to_meet
  has_many :jobs, through: :leader_to_meet
  has_many :leaders, through: :leader_to_meet
  has_many :child_to_meet
  has_many :child, through: :child_to_meet

  scope :in_order, ->{ order("meet_date") }

  validates_uniqueness_of :meet_date
end
