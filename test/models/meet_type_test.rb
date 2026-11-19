# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  deleted    :integer          default(0)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class MeetTypeTest < ActiveSupport::TestCase
  test 'requires a unique name and accepts nested job counts' do
    job = create_job
    meet_type = create_meet_type
    assert meet_type.update(meet_type_jobs_attributes: [{ job_id: job.id, count: 2 }])

    assert_equal 2, meet_type.meet_type_jobs.sole.count
    assert_not MeetType.new(name: meet_type.name).valid?
  end
end
