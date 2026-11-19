# frozen_string_literal: true

require 'test_helper'

class HowContactsControllerTest < ActionController::TestCase
  test 'creates a contact method and renders invalid input' do
    post :create, params: { how_contact: { contact_type: 'Email' } }
    assert_redirected_to how_contacts_path
    assert HowContact.exists?(contact_type: 'Email')

    post :create, params: { how_contact: { contact_type: '' } }
    assert_response :success
  end

  test 'updates and soft deletes a contact method' do
    contact = create_how_contact(contact_type: 'Phone')

    patch :update, params: { id: contact.id, how_contact: { contact_type: 'Text' } }
    assert_redirected_to how_contacts_path
    assert_equal 'Text', contact.reload.contact_type

    delete :destroy, params: { id: contact.id }
    assert_redirected_to how_contacts_path
    assert_nil HowContact.find_by(id: contact.id)
    assert_equal 1, HowContact.unscoped.find(contact.id).expired
  end
end
