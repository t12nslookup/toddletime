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
  # test "the truth" do
  #   assert true
  # end
end
