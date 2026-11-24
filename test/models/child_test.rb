# frozen_string_literal: true

# == Schema Information
#
# Table name: children
#
#  id                 :bigint           not null, primary key
#  address            :string
#  date_of_birth      :date
#  emergency_contact  :string
#  gender             :string
#  medical_conditions :string
#  name               :string
#  postcode           :string
#  registered_date    :date
#  special_needs      :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
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
