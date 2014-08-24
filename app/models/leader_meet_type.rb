class LeaderMeetType < ActiveRecord::Base
  belongs_to :leader
  belongs_to :meet_type
  has_many :job

  validates_uniqueness_of :leader_id, scope: :meet_type_id
end
