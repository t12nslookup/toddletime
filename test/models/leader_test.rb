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
  # test "the truth" do
  #   assert true
  # end
end
