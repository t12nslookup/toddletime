# frozen_string_literal: true

# == Schema Information
#
# Table name: how_contacts
#
#  id           :bigint           not null, primary key
#  contact_type :string
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class HowContactTest < ActiveSupport::TestCase
  test 'requires unique contact types and soft deletes records' do
    contact = create_how_contact(contact_type: 'Email')

    assert_not HowContact.new(contact_type: 'Email').valid?
    contact.destroy

    assert_nil HowContact.find_by(id: contact.id)
    assert_equal 1, HowContact.unscoped.find(contact.id).expired
  end
end
