class MeetType < ActiveRecord::Base
  has_many :meets
  has_many :leader_meet_types
  has_many :leaders, through: :leader_meet_types
  has_many :meet_type_jobs
  has_many :jobs, through: :meet_type_jobs

  scope :in_order, ->{ order("name") }

  validates :name, presence: true, uniqueness: true
  accepts_nested_attributes_for :meet_type_jobs, reject_if: proc {|mtj| mtj.count <= 0}
end
