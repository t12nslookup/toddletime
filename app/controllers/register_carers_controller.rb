class RegisterCarersController < ApplicationController
  before_action :load_meet, only: [:new, :create]

  def new
    @carers = Carer.in_order
    if params[:historic].blank?
      @carers = @carers.recent
    end
    if params[:find_text].present? 
      @carers = @carers.search(params[:find_text])
    end

    @carers -= @meet.carers
  end

  def create
    if params[:carer_id].present?
      @meet.carers << Carer.find(params[:carer_id])
    end
#    raise params.inspect
    redirect_to register_meet_path(@meet)
  end

  private
    def load_meet
      @meet = Meet.find(params[:meet_id])
    end
end
