class LeaderToMeet < ActiveRecord::Base
  belongs_to :meet
  belongs_to :leader

  validates_uniqueness_of :meet_id, scope: :leader_id
end
