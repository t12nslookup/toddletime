# frozen_string_literal: true

require 'test_helper'

class CarerToChildrenControllerTest < ActionController::TestCase
  test 'creates a relationship and redirects to the originating carer' do
    carer = create_carer
    child = create_child

    post :create, params: {
      from: 'carer',
      carer_to_child: { carer_id: carer.id, child_id: child.id, relationship: 'Parent' }
    }

    assert_redirected_to carer
    assert_equal [child], carer.reload.children
  end

  test 'renders the form when a relationship is missing' do
    post :create, params: {
      carer_to_child: { carer_id: create_carer.id, child_id: create_child.id, relationship: '' }
    }

    assert_response :success
  end
end
