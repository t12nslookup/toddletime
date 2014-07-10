class LeaderToMeet < ActiveRecord::Base
  belongs_to :leader
  belongs_to :job
  belongs_to :meet

  validates_uniqueness_of :leader_id, scope: :meet_id
end
