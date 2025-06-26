# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  deleted    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class MeetTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
