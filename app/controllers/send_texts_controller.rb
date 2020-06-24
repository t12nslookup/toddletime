class SendTextsController < ApplicationController
  before_action :load_text, only: %i[update edit show deliver]
  def index
    @texts = SendText.in_order
    @texts = @texts.recent if params[:historic].blank?
  end

  def new
    @meet_types_list = meet_list
    @send_text = SendText.new
    @send_text.meet_type = MeetType.find(params[:meet_type_id]) if params[:meet_type_id]
  end

  def show
  end

  def edit; end

  def create
    @send_text = SendText.new(send_text_params)

    # is this a meet_type specific text, or an event type
    if @send_text.meet_type.present?
      # meet type text
      @carers = Carer.select { |c| c.meet_recent?(@send_text.meet_type.id) }
                     .select { |c| c.meet_text?(@send_text.meet_type.id) }
    else
      # special event text
      @carers = Carer.meet_recent.select(&:events_text?)
    end

    @send_text.addresses = texts(@carers)

    if @send_text.save
      redirect_to send_texts_path
    else
      @meet_types_list = meet_list
      render 'new'
    end
  end

  def update
    if @send_text.update(send_text_params)
      redirect_to send_texts_path
    else
      render 'edit'
    end
  end

  def deliver
    # if @send_text.meet_type.present?
    #   UserMailer.meet_text(@send_text).deliver_now
    # else
    #   UserMailer.event_text(@send_text).deliver_now
    # end
    # @send_text.delivered_at = Time.now
    # @send_text.save

    redirect_to send_texts_path, notice: 'text was successfully sent.'
  end

  private

  def texts(carers)
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

  def send_text_params
    params.require(:send_text)
          .permit(:message,
                  :meet_type_id,
                  :addresses)
  end

  def load_text
    @send_text = SendText.find(params[:id])
  end
end
