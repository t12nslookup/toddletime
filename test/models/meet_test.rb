# frozen_string_literal: true

require 'test_helper'

class MeetTest < ActiveSupport::TestCase
  test 'requires a unique date' do
    meet = create_meet

    assert_not Meet.new(meet_date: meet.meet_date, meet_type: create_meet_type).valid?
    assert_not Meet.new(meet_type: create_meet_type).valid?
  end

  test 'partitions meetings into historic, today and future scopes' do
    historic = create_meet(meet_date: Date.current - 1)
    today = create_meet(meet_date: Date.current)
    future = create_meet(meet_date: Date.current + 1)

    assert_equal [historic], Meet.find_historic.to_a
    assert_equal [today, future], Meet.find_future.to_a
    assert_equal [today], Meet.meets_today.to_a
    assert_equal [future, today], Meet.in_reverse.find_future.to_a
  end
end
