class LeadersController < ApplicationController
  before_action :load_leader, only: [:update, :edit, :show]
  before_action :load_meet_types, only: [:new, :edit]

  def new
    @leader = Leader.new
  end

  def create
    @leader = Leader.new(leader_params)
    @leader.meet_types=MeetType.find(params[:meet_type_id])

    if @leader.save
      redirect_to leaders_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
#    raise params.inspect
    @leader.meet_types=MeetType.find(params[:meet_type_id])
    if @leader.update(leader_params)
      redirect_to leaders_path
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
      params.require(:leader).permit(:name, :email, :dbs)
    end

    def load_leader
      @leader = Leader.find(params[:id])
    end

    def load_meet_types
      @meet_types = MeetType.all
    end
end
