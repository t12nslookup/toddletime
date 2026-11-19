# frozen_string_literal: true

require 'test_helper'

class ChildrenControllerTest < ActionController::TestCase
  test 'creates and updates a child' do
    post :create, params: {
      child: { name: 'Taylor Child', registered_date: Date.current, gender: 'F' }
    }
    child = Child.find_by(name: 'Taylor Child')
    assert_redirected_to child

    patch :update, params: { id: child.id, child: { name: 'Jordan Child' } }
    assert_redirected_to child
    assert_equal 'Jordan Child', child.reload.name
  end

  test 'lists children and filters the carer picker' do
    create_child(name: 'Alex Child')
    create_child(name: 'Bailey Child')
    carer = create_carer(name: 'Alex Parent')

    get :index, params: { historic: 'true' }
    assert_response :success
    assert_includes response.body, 'Alex Child'

    get :add_carer, params: { id: create_child.id, find_text: 'Alex' }
    assert_response :success
    assert_includes response.body, 'Alex Parent'
    assert_not_includes response.body, 'Test Carer'
  end

  test 'destroys a child' do
    child = create_child

    delete :destroy, params: { id: child.id }

    assert_redirected_to children_path
    assert_not Child.exists?(child.id)
  end
end
