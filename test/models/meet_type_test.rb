# == Schema Information
#
# Table name: meet_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  deleted    :integer          default("0")
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class MeetTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
