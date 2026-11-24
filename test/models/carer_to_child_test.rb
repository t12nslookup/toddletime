# frozen_string_literal: true

require 'test_helper'

# == Schema Information
#
# Table name: carer_to_children
#
#  id           :bigint           not null, primary key
#  relationship :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  carer_id     :bigint           indexed
#  child_id     :bigint           indexed
#
# Indexes
#
#  index_carer_to_children_on_carer_id  (carer_id)
#  index_carer_to_children_on_child_id  (child_id)
#
# Foreign Keys
#
#  fk_carer_to_child_carer  (carer_id => carers.id)
#  fk_carer_to_child_child  (child_id => children.id)
#
class CarerToChildTest < ActiveSupport::TestCase
  test 'requires a relationship and prevents duplicate carer-child links' do
    carer = create_carer
    child = create_child

    assert_not CarerToChild.new(carer: carer, child: child).valid?
    association = CarerToChild.create!(carer: carer, child: child, relationship: 'Parent')
    duplicate = CarerToChild.new(carer: carer, child: child, relationship: 'Guardian')

    assert association.valid?
    assert_not duplicate.valid?
  end
end
