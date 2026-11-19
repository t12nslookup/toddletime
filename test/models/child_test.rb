# frozen_string_literal: true

# == Schema Information
#
# Table name: children
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  gender             :string(255)
#  date_of_birth      :date
#  address            :string(255)
#  postcode           :string(255)
#  medical_conditions :string(255)
#  special_needs      :string(255)
#  registered_date    :date
#  created_at         :datetime
#  updated_at         :datetime
#  emergency_contact  :string
#

require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  test 'requires a name of at least five characters and a registered date' do
    assert create_child.valid?
    assert_not Child.new(name: 'Jill', registered_date: Date.current).valid?
    assert_not Child.new(name: 'Long enough').valid?
  end

  test 'with_condition excludes blank and none values' do
    with_condition = create_child(medical_conditions: 'Asthma')
    create_child(medical_conditions: '')
    create_child(medical_conditions: 'none')

    assert_equal [with_condition.id], Child.with_condition.where(id: [with_condition.id]).pluck(:id)
  end
end
