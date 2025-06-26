# frozen_string_literal: true

# == Schema Information
#
# Table name: carers
#
#  id              :bigint           not null, primary key
#  name            :string
#  phone           :string
#  email           :string
#  can_contact     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  address         :string
#  postcode        :string
#  how_heard_id    :bigint           indexed
#  other_heard     :string
#  how_contact_id  :bigint           indexed
#  what_contact_id :bigint           indexed
#

require 'test_helper'

class CarerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
