# frozen_string_literal: true

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

require 'test_helper'

class LeaderToMeetTest < ActiveSupport::TestCase
  test 'prevents registering a leader twice for the same meet' do
    meet = create_meet
    leader = create_leader
    meet.leader_to_meets.create!(leader: leader)

    assert_not LeaderToMeet.new(meet: meet, leader: leader).valid?
  end
end
