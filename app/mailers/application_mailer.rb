# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'toddletime@edgeleyandcheadleheath.org.uk'
  layout 'mailer'
end
