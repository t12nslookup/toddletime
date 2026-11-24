# frozen_string_literal: true

# == Schema Information
#
# Table name: leaders
#
#  id         :bigint           not null, primary key
#  dbs        :date
#  email      :string
#  expired    :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
