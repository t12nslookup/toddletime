# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'toddletime.up.railway.app'
    @mailer_url_options = ActionMailer::Base.default_url_options.dup
    ActionMailer::Base.default_url_options[:host] = 'toddletime.up.railway.app'
  end

  teardown do
    ActionMailer::Base.default_url_options = @mailer_url_options
  end

  test 'authenticates an approved user by username' do
    create_user(username: 'login_parent')

    post user_session_path, params: {
      user: { login: 'login_parent', password: 'password123' }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
  end

  test 'does not authenticate an unapproved user' do
    create_user(username: 'pending_parent', approved: false)

    post user_session_path, params: {
      user: { login: 'pending_parent', password: 'password123' }
    }

    assert_response :redirect
    assert_not_nil flash[:alert]
  end

  test 'accepts the username during registration and leaves approval pending' do
    post user_registration_path, params: {
      user: {
        username: 'new_parent',
        email: 'new-parent@example.test',
        password: 'password123',
        password_confirmation: 'password123'
      }
    }

    user = User.find_by!(username: 'new_parent')
    assert_not user.approved?
    assert_not user.confirmed?
  end
end
