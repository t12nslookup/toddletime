# frozen_string_literal: true

require 'test_helper'

class RegisterChildrenControllerTest < ActionController::TestCase
  test 'suggests unregistered children linked to registered carers only once' do
    meet = create_meet
    first_child = create_child(name: 'First Suggested Child')
    second_child = create_child(name: 'Second Suggested Child')
    suggested_carer = create_carer
    another_carer = create_carer
    first_child.carer_to_children.create!(carer: suggested_carer, relationship: 'Parent')
    first_child.carer_to_children.create!(carer: another_carer, relationship: 'Parent')
    second_child.carer_to_children.create!(carer: suggested_carer, relationship: 'Parent')
    meet.carers << suggested_carer
    meet.carers << another_carer

    get :new, params: { meet_id: meet.id, historic: 'true' }

    assert_response :success
    assert_select 'h2', 'Suggested Children'
    assert_select 'h2 + .table-responsive tbody tr td:first-child', text: 'First Suggested Child', count: 1
    assert_select 'tbody tr td:first-child', text: 'First Suggested Child', count: 1
    assert_select 'tbody tr td:first-child', text: 'Second Suggested Child', count: 1
  end

  test 'adds multiple selected children to the meet' do
    meet = create_meet
    selected_children = [create_child, create_child]

    post :create, params: { meet_id: meet.id, child_id: selected_children.map(&:id) }

    assert_redirected_to register_meet_path(meet)
    assert_equal selected_children.map(&:id).sort, meet.reload.child_ids.sort
  end

  test 'filters suggestions by name and excludes already registered children' do
    meet = create_meet
    carer = create_carer
    suggested = create_child(name: 'Matching Suggested Child')
    registered = create_child(name: 'Matching Registered Child')
    other = create_child(name: 'Other Child')
    [suggested, registered, other].each do |child|
      child.carer_to_children.create!(carer: carer, relationship: 'Parent')
    end
    meet.carers << carer
    meet.children << registered

    get :new, params: { meet_id: meet.id, find_text: 'Matching' }

    assert_response :success
    assert_select "input[name='child_id[]'][value='#{suggested.id}']", count: 1
    assert_select "input[name='child_id[]'][value='#{registered.id}']", count: 0
    assert_select "input[name='child_id[]'][value='#{other.id}']", count: 0
  end

  test 'hides suggestions when all linked children are already registered' do
    meet = create_meet
    child = create_child
    carer = create_carer
    child.carer_to_children.create!(carer: carer, relationship: 'Parent')
    meet.carers << carer
    meet.children << child

    get :new, params: { meet_id: meet.id }

    assert_response :success
    assert_select 'h2', text: 'Suggested Children', count: 0
    assert_select "input[name='child_id[]'][value='#{child.id}']", count: 0
  end
end
