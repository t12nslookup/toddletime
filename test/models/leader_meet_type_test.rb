# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_meet_types
#
#  id           :bigint           not null, primary key
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  leader_id    :bigint           indexed
#  meet_type_id :bigint           indexed
#
# Indexes
#
#  index_leader_meet_types_on_leader_id     (leader_id)
#  index_leader_meet_types_on_meet_type_id  (meet_type_id)
#
# Foreign Keys
#
#  fk_leader_meet_type_leader     (leader_id => leaders.id)
#  fk_leader_meet_type_meet_type  (meet_type_id => meet_types.id)
#

require 'test_helper'

class LeaderMeetTypeTest < ActiveSupport::TestCase
  test 'prevents duplicate assignments and soft deletes them' do
    leader = create_leader
    meet_type = create_meet_type
    association = LeaderMeetType.create!(leader: leader, meet_type: meet_type)

    assert_not LeaderMeetType.new(leader: leader, meet_type: meet_type).valid?
    association.destroy

    assert_nil LeaderMeetType.find_by(id: association.id)
    assert_equal 1, LeaderMeetType.unscoped.find(association.id).expired
  end
end
