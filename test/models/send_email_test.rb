# frozen_string_literal: true

# == Schema Information
#
# Table name: send_emails
#
#  id           :bigint           not null, primary key
#  addresses    :string
#  body         :string
#  delivered_at :datetime
#  state        :integer          default(0)
#  subject      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  meet_type_id :bigint           indexed
#
# Indexes
#
#  index_send_emails_on_meet_type_id  (meet_type_id)
#
# Foreign Keys
#
#  fk_rails_...  (meet_type_id => meet_types.id)
#

require 'test_helper'

class SendEmailTest < ActiveSupport::TestCase
  test 'uses special event label when no meet type is set' do
    assert_equal 'Special Event', SendEmail.new.meet_name
  end

  test 'uses its meet type name and orders newest records first' do
    meet_type = create_meet_type
    older = SendEmail.create!(meet_type: meet_type, subject: 'Older')
    newer = SendEmail.create!(meet_type: meet_type, subject: 'Newer')

    assert_equal meet_type.name, newer.meet_name
    assert_equal [newer, older], SendEmail.in_order.limit(2).to_a
  end
end
