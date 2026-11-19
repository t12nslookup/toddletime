# frozen_string_literal: true

require 'test_helper'

class CarersControllerTest < ActionController::TestCase
  test 'creates a carer with contact preferences' do
    what_contact = create_what_contact
    how_contact = create_how_contact

    post :create, params: {
      carer: { name: 'Sam Carer', phone: '01611234567', email: 'sam@example.test',
               what_contact_id: what_contact.id },
      how_contact_id: [how_contact.id]
    }

    carer = Carer.find_by(email: 'sam@example.test')
    assert_redirected_to carer
    assert_equal [how_contact], carer.how_contacts
  end

  test 'updates and deletes a carer' do
    carer = create_carer

    patch :update, params: {
      id: carer.id,
      carer: { name: 'Updated Carer', phone: '01619876543', what_contact_id: carer.what_contact_id }
    }
    assert_redirected_to carer
    assert_equal 'Updated Carer', carer.reload.name

    delete :destroy, params: { id: carer.id }
    assert_redirected_to carers_path
    assert_not Carer.exists?(carer.id)
  end

  test 'filters the index and child picker by search text' do
    recent = create_carer(name: 'Recent Parent')
    old = create_carer(name: 'Historic Parent')
    old.update_columns(created_at: 1.year.ago, updated_at: 1.year.ago)

    get :index
    assert_response :success
    assert_includes response.body, recent.name
    assert_not_includes response.body, old.name

    get :index, params: { historic: 'true' }
    assert_includes response.body, old.name

    create_child(name: 'Alex Example')
    create_child(name: 'Bailey Example')
    get :add_child, params: { id: recent.id, find_text: 'Alex' }
    assert_response :success
    assert_includes response.body, 'Alex Example'
    assert_not_includes response.body, 'Bailey Example'
  end
end
