# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'renders model validation errors' do
    job = Job.new
    job.valid?

    assert_includes errors_for(job), 'Name can&#39;t be blank'
  end
end
