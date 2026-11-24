# frozen_string_literal: true

# == Schema Information
#
# Table name: send_texts
#
#  id           :bigint           not null, primary key
#  addresses    :string
#  delivered_at :datetime
#  message      :string
#  state        :integer          default(0), indexed
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  meet_type_id :bigint           indexed
#
# Indexes
#
#  index_send_texts_on_meet_type_id  (meet_type_id)
#  index_send_texts_on_state         (state)
#
# Foreign Keys
#
#  fk_rails_...  (meet_type_id => meet_types.id)
#
require 'test_helper'

class SendTextTest < ActiveSupport::TestCase
  test 'uses special event label when no meet type is set' do
    assert_equal 'Special Event', SendText.new.meet_name
  end

  test 'uses its meet type name' do
    meet_type = create_meet_type
    text = SendText.create!(meet_type: meet_type, message: 'Meet soon')

    assert_equal meet_type.name, text.meet_name
  end
end
