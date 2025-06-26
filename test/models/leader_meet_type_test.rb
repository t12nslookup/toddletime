# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_meet_types
#
#  id           :bigint           not null, primary key
#  leader_id    :bigint           indexed
#  meet_type_id :bigint           indexed
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class LeaderMeetTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
