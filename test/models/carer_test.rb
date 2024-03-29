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
# Foreign Keys
#
#  fk_carer_to_how_contact   (how_contact_id => how_contacts.id)
#  fk_carer_to_how_heard     (how_heard_id => how_heards.id)
#  fk_carer_to_what_contact  (what_contact_id => what_contacts.id)
#

require 'test_helper'

class CarerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
