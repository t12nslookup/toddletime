# frozen_string_literal: true

class SendEmailsController < ApplicationController
  before_action :load_email, only: %i[update edit show deliver]
  def index
    @emails = SendEmail.in_order
    @emails = @emails.recent if params[:historic].blank?
  end

  def new
    @meet_types_list = meet_list
    @send_email = SendEmail.new
    @send_email.meet_type = MeetType.find(params[:meet_type_id]) if params[:meet_type_id]
  end

  def show
    if @send_email.meet_type.present?
      render 'user_mailer/meet_email', layout: 'layouts/preview'
    else
      render 'user_mailer/event_email', layout: 'layouts/preview'
    end
  end

  def edit; end

  def create
    @send_email = SendEmail.new(send_email_params)

    # is this a meet_type specific email, or an event type
    @carers = if @send_email.meet_type.present?
                # meet type email
                Carer.select { |c| c.meet_recent?(@send_email.meet_type.id) }
                     .select { |c| c.meet_email?(@send_email.meet_type.id) }
              else
                # special event email
                Carer.meet_recent.select(&:events_email?)
              end

    @send_email.addresses = emails(@carers)

    if @send_email.save
      redirect_to send_emails_path
    else
      @meet_types_list = meet_list
      render 'new'
    end
  end

  def update
    if @send_email.update(send_email_params)
      redirect_to send_emails_path
    else
      render 'edit'
    end
  end

  def deliver
    if @send_email.meet_type.present?
      UserMailer.meet_email(@send_email).deliver_now
    else
      UserMailer.event_email(@send_email).deliver_now
    end
    @send_email.delivered_at = Time.now
    @send_email.save

    redirect_to send_emails_path, notice: 'Email was successfully sent.'
  end

  private

  def emails(carers)
    carers.map(&:full_email).join(', ')
  end

  # Object to store name to id mappings of "Meet Types", including
  # a fake nil/"Special Event"
  class MeetList
    attr_accessor :id, :name

    def initialize(id, name)
      @id = id
      @name = name
    end
  end

  def meet_list
    [MeetList.new(nil, 'Special Event')] +
      MeetType.all.map { |mt| MeetList.new(mt.id, mt.name) }
  end

  def send_email_params
    params.require(:send_email)
          .permit(:subject,
                  :body,
                  :meet_type_id,
                  :addresses)
  end

  def load_email
    @send_email = SendEmail.find(params[:id])
  end
end
