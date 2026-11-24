# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  approved               :boolean          default(FALSE), not null, indexed
#  confirmation_sent_at   :datetime
#  confirmation_token     :string           uniquely indexed
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null, uniquely indexed
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string           uniquely indexed
#  sign_in_count          :integer          default(0), not null
#  username               :string           uniquely indexed
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_approved              (approved)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'authenticates by username or email without regard to case' do
    user = create_user(username: 'parent_login', email: 'parent@example.test')

    assert_equal user, User.find_for_database_authentication(login: 'PARENT_LOGIN')
    assert_equal user, User.find_for_database_authentication(login: 'PARENT@EXAMPLE.TEST')
  end

  test 'requires approval to authenticate and provides the username as login' do
    user = create_user(username: 'waiting_parent', approved: false)

    assert_equal user.username, user.login
    assert_not user.active_for_authentication?
    assert_equal :not_approved, user.inactive_message

    user.update!(approved: true)
    assert user.active_for_authentication?
  end
end
