# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_type_jobs
#
#  id           :bigint           not null, primary key
#  count        :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  job_id       :bigint           indexed
#  meet_type_id :bigint           indexed
#
# Indexes
#
#  index_meet_type_jobs_on_job_id        (job_id)
#  index_meet_type_jobs_on_meet_type_id  (meet_type_id)
#
# Foreign Keys
#
#  fk_meet_type_job_job        (job_id => jobs.id)
#  fk_meet_type_job_meet_type  (meet_type_id => meet_types.id)
#

require 'test_helper'

class MeetTypeJobTest < ActiveSupport::TestCase
  test 'has_count returns only positive job counts' do
    meet_type = create_meet_type
    positive = meet_type.meet_type_jobs.create!(job: create_job, count: 2)
    zero_count = meet_type.meet_type_jobs.create!(job: create_job, count: 0)

    assert zero_count.valid?
    assert_equal [positive], MeetTypeJob.has_count.where(meet_type: meet_type).to_a
  end
end
