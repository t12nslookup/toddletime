# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_meets
#
#  id         :integer          not null, primary key
#  carer_id   :integer          indexed
#  meet_id    :integer          indexed
#  created_at :datetime
#  updated_at :datetime
#
# Foreign Keys
#
#  fk_carer_to_meet_carer  (carer_id => carers.id)
#  fk_carer_to_meet_meet   (meet_id => meets.id)
#

require 'test_helper'

class CarerToMeetTest < ActiveSupport::TestCase
  test 'prevents registering a carer twice for the same meet' do
    meet = create_meet
    carer = create_carer
    meet.carer_to_meets.create!(carer: carer)

    duplicate = CarerToMeet.new(meet: meet, carer: carer)
    assert_not duplicate.valid?
  end
end
