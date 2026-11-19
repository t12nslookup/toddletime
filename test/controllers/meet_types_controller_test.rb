# frozen_string_literal: true

require 'test_helper'

class MeetTypesControllerTest < ActionController::TestCase
  test 'creates a meet type with job requirements' do
    job = create_job

    post :create, params: {
      meet_type: {
        name: 'Toddler Club',
        meet_type_jobs_attributes: { '0' => { job_id: job.id, count: 2 } }
      }
    }

    meet_type = MeetType.find_by(name: 'Toddler Club')
    assert_redirected_to meet_types_path
    assert_equal 2, meet_type.meet_type_jobs.find_by!(job: job).count
  end

  test 'updates an existing job requirement through nested attributes' do
    meet_type = create_meet_type
    job = create_job
    requirement = meet_type.meet_type_jobs.create!(job: job, count: 1)

    patch :update, params: {
      id: meet_type.id,
      meet_type: {
        name: meet_type.name,
        meet_type_jobs_attributes: { '0' => { id: requirement.id, job_id: job.id, count: 3 } }
      }
    }

    assert_redirected_to meet_types_path
    assert_equal 3, requirement.reload.count
  end
end
