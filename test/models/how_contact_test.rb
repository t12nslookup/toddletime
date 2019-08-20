# == Schema Information
#
# Table name: how_contacts
#
#  id           :integer          not null, primary key
#  contact_type :string
#  expired      :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class HowContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
