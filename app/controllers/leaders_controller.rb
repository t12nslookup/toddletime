class LeadersController < ApplicationController
  before_action :load_leader, only: [:update, :edit, :show]
  def new
    @leader = Leader.new
  end
  def create
    @leader = Leader.new(leader_params)

    if @leader.save
      redirect_to @leader
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @leader.update(leader_params)
      redirect_to @leader
    else
      render 'edit'
    end
  end
  def show
  end
  def index
    @leaders = Leader.in_order
  end
  private
    def leader_params
      params.require(:leader).permit(:name, :email)
    end
    def load_leader
      @leader = Leader.find(params[:id])
    end
end
