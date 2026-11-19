# frozen_string_literal: true

require 'test_helper'

class ConfirmationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'toddletime.up.railway.app'
  end

  test 'renders the resend-confirmation form' do
    get new_user_confirmation_path

    assert_response :success
    assert_select 'input[name="user[login]"]'
  end

  test 'renders an error for an invalid confirmation token' do
    get user_confirmation_path, params: { confirmation_token: 'invalid-token' }

    assert_response :success
    assert_includes response.body, 'Confirmation token'
  end

  test 'confirms an account with a valid token' do
    suffix = SecureRandom.hex(5)
    user = User.new(
      email: "pending-#{suffix}@example.test",
      username: "pending_#{suffix}",
      password: 'password123',
      password_confirmation: 'password123',
      approved: true
    )
    user.skip_confirmation_notification!
    user.save!
    raw_token, encrypted_token = Devise.token_generator.generate(User, :confirmation_token)
    user.update_columns(confirmation_token: encrypted_token, confirmed_at: nil)

    get user_confirmation_path, params: { confirmation_token: raw_token }

    assert user.reload.confirmed?
    assert user.valid_password?('password123')
    assert_response :redirect
  end
end
