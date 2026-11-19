# frozen_string_literal: true

require 'test_helper'

class RegisterLeadersControllerTest < ActionController::TestCase
  test 'filters available leaders and excludes registered leaders' do
    meet = create_meet
    suggested = create_leader(name: 'Alex Leader')
    registered = create_leader(name: 'Bailey Leader')
    meet.leader_to_meets.create!(leader: registered)

    get :new, params: { meet_id: meet.id, find_text: 'Alex' }

    assert_response :success
    assert_includes response.body, suggested.name
    assert_not_includes response.body, registered.name
  end

  test 'adds multiple selected leaders' do
    meet = create_meet
    leaders = [create_leader, create_leader]

    post :create, params: { meet_id: meet.id, leader_id: leaders.map(&:id) }

    assert_redirected_to register_meet_path(meet)
    assert_equal leaders.map(&:id).sort, meet.reload.leader_ids.sort
  end
end
