# frozen_string_literal: true

# == Schema Information
#
# Table name: leaders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  expired    :date
#  created_at :datetime
#  updated_at :datetime
#  dbs        :date
#

require 'test_helper'

class LeaderTest < ActiveSupport::TestCase
  test 'requires a unique name of at least five characters' do
    leader = create_leader(name: 'Alex Leader')

    assert_not Leader.new(name: 'Alex').valid?
    assert_not Leader.new(name: leader.name).valid?
  end

  test 'destroy expires a leader without physically deleting it' do
    leader = create_leader

    assert_difference('Leader.unscoped.count', 0) { leader.destroy }
    assert_nil Leader.find_by(id: leader.id)
    assert_equal Date.current, Leader.unscoped.find(leader.id).expired
  end
end
