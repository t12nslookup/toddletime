# frozen_string_literal: true

# == Schema Information
#
# Table name: send_texts
#
#  id           :bigint           not null, primary key
#  addresses    :string
#  message      :string
#  meet_type_id :bigint           indexed
#  state        :integer          default(0), indexed
#  delivered_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class SendTextTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
