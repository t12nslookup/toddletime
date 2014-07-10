class Job < ActiveRecord::Base
  has_many :leader_to_jobs
  has_many :leaders, through: :leader_to_jobs
  has_many :meet_type_jobs
  has_many :meet_types, through: :meet_type_jobs

  scope :in_order, ->{ order("name") }

  validates :name, presence: true, uniqueness: true
end
