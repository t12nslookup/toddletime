# frozen_string_literal: true

# == Schema Information
#
# Table name: meet_types
#
#  id         :bigint           not null, primary key
#  deleted    :integer          default(0)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
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
