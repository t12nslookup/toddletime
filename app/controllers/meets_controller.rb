class MeetsController < ApplicationController

  before_action :load_meet, only: [:show, :register]

  def new
    @meet = Meet.new
  end

  def create
    @meet = Meet.new(meet_params)

    if @meet.save
      redirect_to @meet
    else
      render 'new'
    end
  end

  def register
    @children = @meet.children.in_order
    @carers = @meet.carers.in_order
#    @carers = @meet.carers.in_order
  end

  def show
  end

  def index
    @meets = Meet.in_order
  end

  private
    def meet_params
      params.require(:meet).permit(:meet_date, :meet_type_id)
    end

    def load_meet
      @meet = Meet.find(params[:id])
    end
end
