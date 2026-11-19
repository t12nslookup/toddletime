# frozen_string_literal: true

require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  test 'creates a job and rejects a blank name' do
    post :create, params: { job: { name: 'Door monitor' } }
    assert_redirected_to jobs_path
    assert Job.exists?(name: 'Door monitor')

    post :create, params: { job: { name: '' } }
    assert_response :success
    assert_not Job.exists?(name: '')
  end

  test 'updates and deletes a job' do
    job = create_job

    patch :update, params: { id: job.id, job: { name: 'Updated role' } }
    assert_redirected_to jobs_path
    assert_equal 'Updated role', job.reload.name

    delete :destroy, params: { id: job.id }
    assert_redirected_to jobs_path
    assert_not Job.exists?(job.id)
  end
end
