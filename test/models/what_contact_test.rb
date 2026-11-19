# frozen_string_literal: true

# == Schema Information
#
# Table name: what_contacts
#
#  id           :bigint           not null, primary key
#  contact_type :string
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class WhatContactTest < ActiveSupport::TestCase
  test 'requires unique contact categories and soft deletes records' do
    contact = create_what_contact(contact_type: 'All')

    assert_not WhatContact.new(contact_type: 'All').valid?
    contact.destroy

    assert_nil WhatContact.find_by(id: contact.id)
    assert_equal 1, WhatContact.unscoped.find(contact.id).expired
  end
end
