# == Schema Information
#
# Table name: carers
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  phone           :string(255)
#  email           :string(255)
#  can_contact     :integer
#  created_at      :datetime
#  updated_at      :datetime
#  address         :string(255)
#  postcode        :string(255)
#  how_heard_id    :integer          indexed
#  other_heard     :string(255)
#  how_contact_id  :integer          indexed
#  what_contact_id :integer          indexed
#
# Foreign Keys
#
#  fk_carer_to_how_heard  (how_heard_id => how_heards.id)
#

require 'test_helper'

class CarerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
