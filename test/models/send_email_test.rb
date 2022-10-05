# frozen_string_literal: true

# == Schema Information
#
# Table name: send_emails
#
#  id           :integer          not null, primary key
#  addresses    :string
#  subject      :string
#  body         :string
#  meet_type_id :integer          indexed
#  state        :integer          default("0")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  delivered_at :datetime
#
# Foreign Keys
#
#  fk_rails_...  (meet_type_id => meet_types.id)
#

require 'test_helper'

class SendEmailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
