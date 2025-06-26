# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_type_jobs
#
#  id           :bigint           not null, primary key
#  job_id       :bigint           indexed
#  meet_type_id :bigint           indexed
#  count        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class MeetTypeJobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
