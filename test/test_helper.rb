# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require_relative 'support/test_data'

module ActiveSupport
  class TestCase
    include TestData
  end
end

class ActionController::TestCase
  include Devise::Test::ControllerHelpers

  setup do
    sign_in create_user
  end
end
