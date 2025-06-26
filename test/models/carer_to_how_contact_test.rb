# frozen_string_literal: true

# == Schema Information
#
# Table name: carer_to_how_contacts
#
#  id             :bigint           not null, primary key
#  carer_id       :bigint           not null, indexed
#  how_contact_id :bigint           not null, indexed
#  expired        :integer          default(0), not null, indexed
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'test_helper'

class CarerToHowContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
