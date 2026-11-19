# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null, indexed
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)      indexed
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)      indexed
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string(255)      indexed
#  approved               :boolean          default(FALSE), not null, indexed
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
