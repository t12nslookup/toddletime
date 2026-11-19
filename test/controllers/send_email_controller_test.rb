# frozen_string_literal: true

require 'test_helper'

class SendEmailsControllerTest < ActionController::TestCase
  test 'creates a special-event message with the eligible audience' do
    carer = create_carer(
      email: 'family@example.test',
      what_contact: create_what_contact(contact_type: 'Special Events')
    )
    carer.how_contacts << create_how_contact(contact_type: 'Email')

    post :create, params: { send_email: { subject: 'Picnic', body: 'Join us' } }

    email = SendEmail.order(:created_at).last
    assert_redirected_to send_emails_path
    assert_equal 'Special Event: Picnic', UserMailer.event_email(email).subject
    assert_equal "\"#{carer.name}\" <family@example.test>", email.addresses
  end

  test 'selects recipients by meet type and recent attendance' do
    meet_type = create_meet_type(name: 'Toddler Club')
    carer = create_carer(
      what_contact: create_what_contact(contact_type: 'Toddler Club')
    )
    carer.how_contacts << create_how_contact(contact_type: 'Email')
    create_meet(meet_type: meet_type).carers << carer

    post :create, params: {
      send_email: { meet_type_id: meet_type.id, subject: 'Reminder', body: 'See you soon.' }
    }

    email = SendEmail.order(:created_at).last
    assert_redirected_to send_emails_path
    assert_equal "\"#{carer.name}\" <#{carer.email}>", email.addresses
    assert_equal meet_type, email.meet_type
  end

  test 'delivers a queued event email and records delivery time' do
    email = SendEmail.create!(subject: 'Picnic', body: 'Join us', addresses: 'family@example.test')

    assert_difference -> { ActionMailer::Base.deliveries.size }, 1 do
      get :deliver, params: { id: email.id }
    end

    assert_redirected_to send_emails_path
    assert email.reload.delivered_at
    assert_equal ['family@example.test'], ActionMailer::Base.deliveries.last.bcc
  end
end
