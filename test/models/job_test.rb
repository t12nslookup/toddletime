# frozen_string_literal: true

# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test 'requires a unique name and sorts jobs by name' do
    second = create_job(name: 'Zulu')
    first = create_job(name: 'Alpha')

    assert_equal [first, second], Job.in_order.to_a
    assert_not Job.new(name: '').valid?
    assert_not Job.new(name: first.name).valid?
  end
end
