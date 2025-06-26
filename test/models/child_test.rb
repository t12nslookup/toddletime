# frozen_string_literal: true

# == Schema Information
#
# Table name: children
#
#  id                 :bigint           not null, primary key
#  name               :string
#  gender             :string
#  date_of_birth      :date
#  address            :string
#  postcode           :string
#  medical_conditions :string
#  special_needs      :string
#  registered_date    :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  emergency_contact  :string
#

require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
