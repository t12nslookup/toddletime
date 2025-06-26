# frozen_string_literal: true

# == Schema Information
#
# Table name: leader_to_meets
#
#  id         :bigint           not null, primary key
#  meet_id    :bigint           indexed
#  leader_id  :bigint           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LeaderToMeetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
