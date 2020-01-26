# == Schema Information
#
# Table name: leader_to_meets
#
#  id         :integer          not null, primary key
#  meet_id    :integer          indexed
#  leader_id  :integer          indexed
#  created_at :datetime
#  updated_at :datetime
#
# Foreign Keys
#
#  fk_leader_to_meet_leader  (leader_id => leaders.id)
#  fk_leader_to_meet_meet    (meet_id => meets.id)
#

class LeaderToMeet < ActiveRecord::Base
  belongs_to :meet, inverse_of: :leader_to_meets
  belongs_to :leader, inverse_of: :leader_to_meets

  validates_uniqueness_of :meet_id, scope: :leader_id
end
