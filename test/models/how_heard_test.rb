# frozen_string_literal: true

# == Schema Information
#
# Table name: how_heards
#
#  id            :bigint           not null, primary key
#  expired       :integer          default(0)
#  location_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class HowHeardTest < ActiveSupport::TestCase
  test 'requires unique location names and soft deletes records' do
    source = HowHeard.create!(location_name: 'School')

    assert_not HowHeard.new(location_name: 'School').valid?
    source.destroy

    assert_nil HowHeard.find_by(id: source.id)
    assert_equal 1, HowHeard.unscoped.find(source.id).expired
  end
end
