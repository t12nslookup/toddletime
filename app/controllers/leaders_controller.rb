class LeadersController < ApplicationController
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
    @leader = Leader.find(params[:id])
  end
  def update
    @leader = Leader.find(params[:id])
    if @leader.update(leader_params)
      redirect_to @leader
    else
      render 'edit'
    end
  end
  def show
    @leader = Leader.find(params[:id])
  end
  def index
    @leaders = Leader.order('name')
  end
  private
    def leader_params
      params.require(:leader).permit(:name, :email)
    end
end
