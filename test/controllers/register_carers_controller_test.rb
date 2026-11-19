# frozen_string_literal: true

require 'test_helper'

class RegisterCarersControllerTest < ActionController::TestCase
  test 'suggests unregistered carers linked to registered children only once' do
    meet = create_meet
    first_child = create_child
    second_child = create_child
    suggested_carer = create_carer(name: 'Suggested Carer')
    create_carer(name: 'Other Carer')
    first_child.carer_to_children.create!(carer: suggested_carer, relationship: 'Parent')
    second_child.carer_to_children.create!(carer: suggested_carer, relationship: 'Parent')
    meet.children << first_child
    meet.children << second_child

    get :new, params: { meet_id: meet.id }

    assert_response :success
    assert_select 'h2', 'Suggested Carers'
    assert_select 'h2 + .table-responsive tbody tr td:first-child', text: 'Suggested Carer', count: 1
    assert_select 'tbody tr td:first-child', text: 'Suggested Carer', count: 1
    assert_select 'tbody tr td:first-child', text: 'Other Carer', count: 1
  end

  test 'adds multiple selected carers to the meet' do
    meet = create_meet
    selected_carers = [create_carer, create_carer]

    post :create, params: { meet_id: meet.id, carer_id: selected_carers.map(&:id) }

    assert_redirected_to register_meet_path(meet)
    assert_equal selected_carers.map(&:id).sort, meet.reload.carer_ids.sort
  end

  test 'filters suggestions by name and excludes already registered carers' do
    meet = create_meet
    child = create_child
    suggested = create_carer(name: 'Matching Suggested Carer')
    registered = create_carer(name: 'Matching Registered Carer')
    other = create_carer(name: 'Other Carer')
    [suggested, registered, other].each do |carer|
      child.carer_to_children.create!(carer: carer, relationship: 'Parent')
    end
    meet.children << child
    meet.carers << registered

    get :new, params: { meet_id: meet.id, find_text: 'Matching' }

    assert_response :success
    assert_select "input[name='carer_id[]'][value='#{suggested.id}']", count: 1
    assert_select "input[name='carer_id[]'][value='#{registered.id}']", count: 0
    assert_select "input[name='carer_id[]'][value='#{other.id}']", count: 0
  end

  test 'hides suggestions when all linked carers are already registered' do
    meet = create_meet
    child = create_child
    carer = create_carer
    child.carer_to_children.create!(carer: carer, relationship: 'Parent')
    meet.children << child
    meet.carers << carer

    get :new, params: { meet_id: meet.id }

    assert_response :success
    assert_select 'h2', text: 'Suggested Carers', count: 0
    assert_select "input[name='carer_id[]'][value='#{carer.id}']", count: 0
  end
end
