# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'renders the landing page for a signed-in user' do
    get :index

    assert_response :success
    assert_includes response.body, 'Hello World'
  end

  test 'redirects a signed-out visitor to sign in' do
    sign_out :user

    get :index

    assert_redirected_to new_user_session_path
  end
end
