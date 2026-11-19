# frozen_string_literal: true

require 'test_helper'

class ChildToMeetTest < ActiveSupport::TestCase
  test 'prevents registering a child twice for the same meet' do
    meet = create_meet
    child = create_child
    meet.child_to_meets.create!(child: child)

    assert_not ChildToMeet.new(meet: meet, child: child).valid?
  end
end
