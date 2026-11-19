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
