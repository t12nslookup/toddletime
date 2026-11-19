# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'filters users by approval and lock state' do
    approved_user = create_user(username: 'approved_user')
    pending_user = create_user(username: 'pending_user', approved: false)
    pending_user.update!(locked_at: Time.current)

    get :index, params: { approved: 'false' }
    assert_response :success
    assert_includes response.body, pending_user.username
    assert_not_includes response.body, approved_user.username

    get :index, params: { locked: 'true' }
    assert_includes response.body, pending_user.username
    assert_not_includes response.body, approved_user.username
  end

  test 'approves, locks and unlocks a user' do
    user = create_user(approved: false)

    get :approve, params: { id: user.id }
    assert_redirected_to users_path
    assert user.reload.approved?

    get :lock, params: { id: user.id }
    assert_redirected_to users_path
    assert user.reload.locked_at

    get :unlock, params: { id: user.id }
    assert_redirected_to users_path
    assert_nil user.reload.locked_at
  end
end
