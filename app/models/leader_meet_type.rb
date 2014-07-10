class LeaderMeetType < ActiveRecord::Base
  belongs_to :leader
  belongs_to :meet_type

  validates_uniqueness_of :leader_id, scope: :meet_type_id
end
