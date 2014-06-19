class Job < ActiveRecord::Base
  has_many :leader_to_meet

  validates :name, presence: true, uniqueness: true
end
