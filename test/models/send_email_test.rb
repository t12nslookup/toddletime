# frozen_string_literal: true

# == Schema Information
#
# Table name: send_emails
#
#  id           :bigint           not null, primary key
#  addresses    :string
#  subject      :string
#  body         :string
#  meet_type_id :bigint           indexed
#  state        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  delivered_at :datetime
#

require 'test_helper'

class SendEmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
