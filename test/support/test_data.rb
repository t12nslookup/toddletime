# frozen_string_literal: true

module TestData
  def create_user(**attributes)
    suffix = SecureRandom.hex(5)
    user = User.new(
      {
        email: "test-#{suffix}@example.test",
        username: "test_#{suffix}",
        password: 'password123',
        approved: true
      }.merge(attributes)
    )
    user.skip_confirmation!
    user.save!
    user
  end

  def create_how_contact(contact_type: 'Email')
    HowContact.find_or_create_by!(contact_type: contact_type)
  end

  def create_what_contact(contact_type: 'All')
    WhatContact.find_or_create_by!(contact_type: contact_type)
  end

  def create_carer(**attributes)
    what_contact = attributes.delete(:what_contact) || create_what_contact
    suffix = SecureRandom.hex(4)
    Carer.create!(
      {
        name: "Test Carer #{suffix}",
        phone: '01611234567',
        email: "carer-#{suffix}@example.test",
        what_contact: what_contact
      }.merge(attributes)
    )
  end

  def create_child(**attributes)
    Child.create!(
      {
        name: "Test Child #{SecureRandom.hex(4)}",
        registered_date: Date.current
      }.merge(attributes)
    )
  end

  def create_leader(**attributes)
    Leader.create!({ name: "Test Leader #{SecureRandom.hex(4)}" }.merge(attributes))
  end

  def create_job(**attributes)
    Job.create!({ name: "Test Job #{SecureRandom.hex(4)}" }.merge(attributes))
  end

  def create_meet_type(**attributes)
    MeetType.create!({ name: "Test Meet Type #{SecureRandom.hex(4)}" }.merge(attributes))
  end

  def create_meet(**attributes)
    Meet.create!(
      {
        meet_date: Date.current + 1,
        meet_type: attributes.delete(:meet_type) || create_meet_type
      }.merge(attributes)
    )
  end
end
