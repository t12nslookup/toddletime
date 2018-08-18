class RegisterChildrenController < ApplicationController
  before_action :load_meet, only: %i[new create]

  def new
    @children = Child.in_order
    if params[:historic].blank?
      @children = @children.recent
    end
    if params[:find_text].present? 
      @children = @children.search(params[:find_text])
    end

    @children -= @meet.children
  end

  def create
    if params[:child_id].present?
      @meet.children << Child.find(params[:child_id])
    end
    # raise params.inspect
    redirect_to register_meet_path(@meet)
  end

  private

  def load_meet
    @meet = Meet.find(params[:meet_id])
  end
end
