# frozen_string_literal: true

require 'test_helper'

class LeadersControllerTest < ActionController::TestCase
  test 'creates a leader and assigns a meet type' do
    meet_type = create_meet_type

    post :create, params: {
      leader: { name: 'Jordan Leader', email: 'jordan@example.test' },
      meet_type_id: [meet_type.id]
    }

    leader = Leader.find_by(name: 'Jordan Leader')
    assert_redirected_to leaders_path
    assert_equal [meet_type], leader.meet_types
  end

  test 'updates assignments and expires deleted leaders' do
    leader = create_leader
    meet_type = create_meet_type
    leader.meet_types << meet_type

    patch :update, params: { id: leader.id, leader: { name: 'Updated Leader' } }
    assert_redirected_to leaders_path
    assert_empty leader.reload.meet_types

    get :index
    assert_includes response.body, 'Updated Leader'

    delete :destroy, params: { id: leader.id }
    assert_redirected_to leaders_path
    assert_nil Leader.find_by(id: leader.id)
    assert Leader.unscoped.exists?(id: leader.id)
  end
end
