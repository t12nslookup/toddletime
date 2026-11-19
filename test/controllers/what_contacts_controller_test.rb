# frozen_string_literal: true

require 'test_helper'

class WhatContactsControllerTest < ActionController::TestCase
  test 'creates a contact category and renders invalid input' do
    post :create, params: { what_contact: { contact_type: 'Special Events' } }
    assert_redirected_to what_contacts_path
    assert WhatContact.exists?(contact_type: 'Special Events')

    post :create, params: { what_contact: { contact_type: '' } }
    assert_response :success
  end

  test 'updates and soft deletes a contact category' do
    contact = create_what_contact(contact_type: 'All')

    patch :update, params: { id: contact.id, what_contact: { contact_type: 'Group A' } }
    assert_redirected_to what_contacts_path
    assert_equal 'Group A', contact.reload.contact_type

    delete :destroy, params: { id: contact.id }
    assert_redirected_to what_contacts_path
    assert_nil WhatContact.find_by(id: contact.id)
  end
end
