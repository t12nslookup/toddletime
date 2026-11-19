# frozen_string_literal: true

require 'test_helper'
require 'minitest/mock'

class SendTextsControllerTest < ActionController::TestCase
  test 'creates a special-event text with sanitized message and eligible numbers' do
    carer = create_carer(
      name: 'Text Parent',
      phone: '0161 123 4567',
      what_contact: create_what_contact(contact_type: 'Special Events')
    )
    carer.how_contacts << create_how_contact(contact_type: 'Text')

    post :create, params: { send_text: { message: '  Hello 🚀  friends!  ' } }

    text = SendText.order(:created_at).last
    assert_redirected_to send_texts_path
    assert_equal 'Hello friends!', text.message
    assert_equal "\"#{carer.name}\" <01611234567>", text.addresses
  end

  test 'selects text recipients by meet type and recent attendance' do
    meet_type = create_meet_type(name: 'Toddler Club')
    carer = create_carer(
      what_contact: create_what_contact(contact_type: 'Toddler Club')
    )
    carer.how_contacts << create_how_contact(contact_type: 'Text')
    create_meet(meet_type: meet_type).carers << carer

    post :create, params: {
      send_text: { meet_type_id: meet_type.id, message: 'Reminder' }
    }

    text = SendText.order(:created_at).last
    assert_redirected_to send_texts_path
    assert_equal "\"#{carer.name}\" <01611234567>", text.addresses
    assert_equal meet_type, text.meet_type
  end

  test 'updates and sanitizes an existing message' do
    text = SendText.create!(message: 'Before', addresses: 'parent@example.test')

    patch :update, params: { id: text.id, send_text: { message: '  After 🚀  school!  ' } }

    assert_redirected_to send_texts_path
    assert_equal 'After school!', text.reload.message
  end

  test 'sends the SMS request without contacting the real provider and records success' do
    text = SendText.create!(
      message: 'See you soon',
      addresses: '"Text Parent" <01611234567>'
    )
    response = Struct.new(:code).new(201)
    request_args = nil

    RestClient.stub(:post, ->(*args) { request_args = args; response }) do
      get :deliver, params: { id: text.id }
    end

    assert_redirected_to send_texts_path
    assert_equal 'text message was successfully sent.', flash[:notice]
    assert text.reload.delivered_at
    assert_equal 'https://api.thesmsworks.co.uk/v1/batch/send', request_args.first
    assert_includes request_args.second, '01611234567'
    assert_equal :json, request_args.third[:content_type]
  end
end
