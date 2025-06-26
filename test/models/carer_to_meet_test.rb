# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_meets
#
#  id         :bigint           not null, primary key
#  carer_id   :bigint           indexed
#  meet_id    :bigint           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CarerToMeetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
