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
#  sign_in_count          :integer          default("0"), not null
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
#  approved               :boolean          default("false"), not null, indexed
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
