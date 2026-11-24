# frozen_string_literal: true

# == Schema Information
#
# Table name: carers
#
#  id              :bigint           not null, primary key
#  address         :string
#  can_contact     :integer
#  email           :string
#  name            :string
#  other_heard     :string
#  phone           :string
#  postcode        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  how_contact_id  :bigint           indexed
#  how_heard_id    :bigint           indexed
#  what_contact_id :bigint           indexed
#
# Indexes
#
#  index_carers_on_how_contact_id   (how_contact_id)
#  index_carers_on_how_heard_id     (how_heard_id)
#  index_carers_on_what_contact_id  (what_contact_id)
#
# Foreign Keys
#
#  fk_carer_to_how_contact   (how_contact_id => how_contacts.id)
#  fk_carer_to_how_heard     (how_heard_id => how_heards.id)
#  fk_carer_to_what_contact  (what_contact_id => what_contacts.id)
#

require 'test_helper'

class CarerTest < ActiveSupport::TestCase
  test 'validates contact information and formats addresses' do
    carer = create_carer(email: 'parent@example.test', phone: '0161 123 4567')

    assert_equal "\"#{carer.name}\" <parent@example.test>", carer.full_email
    assert_equal "\"#{carer.name}\" <01611234567>", carer.name_and_phone
    assert_not Carer.new(name: 'A Name').valid?
  end

  test 'matches email and text preferences to meet and event types' do
    meet_type = create_meet_type(name: 'Toddler Time')
    meet_email = create_how_contact(contact_type: 'Email')
    meet_text = create_how_contact(contact_type: 'Text')
    carer = create_carer(what_contact: create_what_contact(contact_type: 'ToddlerTime'))
    carer.how_contacts << [meet_email, meet_text]

    assert carer.meet_email?(meet_type.id)
    assert carer.meet_text?(meet_type.id)
    assert carer.meet_phone?(meet_type.id)
    assert_not carer.events_email?

    event_carer = create_carer(what_contact: create_what_contact(contact_type: 'Special Events'))
    event_carer.how_contacts << meet_email
    assert event_carer.events_email?
  end

  test 'requires an allowed contact type to receive a meet email' do
    meet_type = create_meet_type(name: 'Toddler Time')
    contact = create_how_contact(contact_type: 'Email')
    carer = create_carer(what_contact: create_what_contact(contact_type: 'Another Group'))
    carer.how_contacts << contact

    assert_not carer.meet_email?(meet_type.id)
  end
end
