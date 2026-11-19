# frozen_string_literal: true

require 'test_helper'

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
