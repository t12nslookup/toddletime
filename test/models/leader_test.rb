# frozen_string_literal: true

# == Schema Information
#
# Table name: leaders
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  expired    :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  dbs        :date
#

require 'test_helper'

class LeaderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
