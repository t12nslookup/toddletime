# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_to_meets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  leader_id  :bigint           indexed
#  meet_id    :bigint           indexed
#
# Indexes
#
#  index_leader_to_meets_on_leader_id  (leader_id)
#  index_leader_to_meets_on_meet_id    (meet_id)
#
# Foreign Keys
#
#  fk_leader_to_meet_leader  (leader_id => leaders.id)
#  fk_leader_to_meet_meet    (meet_id => meets.id)
#

require 'test_helper'

class LeaderToMeetTest < ActiveSupport::TestCase
  test 'prevents registering a leader twice for the same meet' do
    meet = create_meet
    leader = create_leader
    meet.leader_to_meets.create!(leader: leader)

    assert_not LeaderToMeet.new(meet: meet, leader: leader).valid?
  end
end
