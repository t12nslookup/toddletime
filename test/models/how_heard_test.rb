# frozen_string_literal: true

# == Schema Information
#
# Table name: how_heards
#
#  id            :bigint           not null, primary key
#  location_name :string
#  expired       :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class HowHeardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
