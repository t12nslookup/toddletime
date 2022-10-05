# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_meet_types
#
#  id           :integer          not null, primary key
#  leader_id    :integer          indexed
#  meet_type_id :integer          indexed
#  expired      :integer          default("0")
#  created_at   :datetime
#  updated_at   :datetime
#
# Foreign Keys
#
#  fk_leader_meet_type_leader     (leader_id => leaders.id)
#  fk_leader_meet_type_meet_type  (meet_type_id => meet_types.id)
#

require 'test_helper'

class LeaderMeetTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
