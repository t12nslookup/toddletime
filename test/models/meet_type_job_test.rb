# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_type_jobs
#
#  id           :integer          not null, primary key
#  job_id       :integer          indexed
#  meet_type_id :integer          indexed
#  count        :integer          default("0")
#  created_at   :datetime
#  updated_at   :datetime
#
# Foreign Keys
#
#  fk_meet_type_job_job        (job_id => jobs.id)
#  fk_meet_type_job_meet_type  (meet_type_id => meet_types.id)
#

require 'test_helper'

class MeetTypeJobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
