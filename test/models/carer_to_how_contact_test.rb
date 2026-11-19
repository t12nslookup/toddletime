# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_how_contacts
#
#  id             :bigint           not null, primary key
#  carer_id       :bigint           not null, indexed
#  how_contact_id :bigint           not null, indexed
#  expired        :integer          default(0), not null, indexed
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (carer_id => carers.id)
#  fk_rails_...  (how_contact_id => how_contacts.id)
#
require 'test_helper'

class CarerToHowContactTest < ActiveSupport::TestCase
  test 'destroy expires a contact preference' do
    association = CarerToHowContact.create!(carer: create_carer, how_contact: create_how_contact)

    association.destroy

    assert_nil CarerToHowContact.find_by(id: association.id)
    assert_equal 1, CarerToHowContact.unscoped.find(association.id).expired
  end
end
