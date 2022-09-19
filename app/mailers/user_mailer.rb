# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def event_email(send_email)
    @send_email = send_email
    mail(bcc: @send_email.addresses,
         subject: "Special Event: #{@send_email.subject}")
  end

  def meet_email(send_email)
    @send_email = send_email
    mail(bcc: @send_email.addresses,
         subject: "#{@send_email.meet_type.name}: #{@send_email.subject}")
  end
end
