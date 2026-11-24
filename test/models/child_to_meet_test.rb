# frozen_string_literal: true

require 'test_helper'

# == Schema Information
#
# Table name: child_to_meets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  child_id   :bigint           indexed
#  meet_id    :bigint           indexed
#
# Indexes
#
#  index_child_to_meets_on_child_id  (child_id)
#  index_child_to_meets_on_meet_id   (meet_id)
#
# Foreign Keys
#
#  fk_child_to_meet_child  (child_id => children.id)
#  fk_child_to_meet_meet   (meet_id => meets.id)
#
class ChildToMeetTest < ActiveSupport::TestCase
  test 'prevents registering a child twice for the same meet' do
    meet = create_meet
    child = create_child
    meet.child_to_meets.create!(child: child)

    assert_not ChildToMeet.new(meet: meet, child: child).valid?
  end
end
