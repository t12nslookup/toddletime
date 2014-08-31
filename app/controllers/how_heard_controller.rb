class HowHeardController < ApplicationController
  before_action :load_how_heard, only: [:update, :edit]
  def new
    @how_heard = HowHeard.new
  end
  def create
    @how_heard = HowHeard.new(how_heard_params)

    if @how_heard.save
      redirect_to how_heard_index_path
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @how_heard.update(how_heard_params)
      redirect_to how_heard_index_path
    else
      render 'edit'
    end
  end
  def index
    @how_heards = HowHeard.in_order
  end
private
  def how_heard_params
    params.require(:how_heard).permit(:location_name)
  end
  def load_how_heard
    @how_heard = HowHeard.find(params[:id])
  end
end
