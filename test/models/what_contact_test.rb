# frozen_string_literal: true

# == Schema Information
#
# Table name: what_contacts
#
#  id           :bigint           not null, primary key
#  contact_type :string
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class WhatContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
