class MeetsController < ApplicationController
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
  def show
    @meet = Meet.find(params[:id])
  end
  def index
    @meets = Meet.in_order
  end
  private
    def meet_params
      params.require(:meet).permit(:meet_date)
    end
end
