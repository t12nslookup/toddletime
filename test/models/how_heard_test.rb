# frozen_string_literal: true

# == Schema Information
#
# Table name: how_heards
#
#  id            :integer          not null, primary key
#  location_name :string(255)
#  expired       :integer          default("0")
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class HowHeardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
