# frozen_string_literal: true

require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'sends event emails as blind copies to the supplied recipients' do
    email = SendEmail.create!(
      addresses: 'one@example.test, two@example.test',
      subject: 'Event invitation',
      body: 'Please join us.'
    )

    message = UserMailer.event_email(email)

    assert_equal 'Special Event: Event invitation', message.subject
    assert_equal ['one@example.test', 'two@example.test'], message.bcc
    assert_includes message.body.encoded, 'Please join us.'
  end

  test 'includes the meet type in meet email subjects' do
    meet_type = create_meet_type(name: 'Toddler Club')
    email = SendEmail.create!(
      meet_type: meet_type,
      addresses: 'parent@example.test',
      subject: 'Reminder',
      body: 'See you soon.'
    )

    message = UserMailer.meet_email(email)

    assert_equal 'Toddler Club: Reminder', message.subject
    assert_equal ['parent@example.test'], message.bcc
    assert_includes message.body.encoded, 'Toddler Club'
  end
end
