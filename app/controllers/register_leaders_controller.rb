class RegisterLeadersController < ApplicationController
  before_action :load_meet, only: %i[new create]

  def new
    @leaders = Leader.in_order
    if params[:find_text].present? 
      @leaders = @leaders.search(params[:find_text])
    end

    @leaders -= @meet.leaders
  end

  def create
    if params[:leader_id].present?
      @meet.leaders << Leader.find(params[:leader_id])
    end
    # raise params.inspect
    redirect_to register_meet_path(@meet)
  end

  private

  def load_meet
    @meet = Meet.find(params[:meet_id])
  end
end
