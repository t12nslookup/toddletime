# frozen_string_literal: true

class LeadersController < ApplicationController
  before_action :load_leader, only: %i[update edit show destroy]
  before_action :load_meet_types, only: %i[new edit]

  def new
    @leader = Leader.new
  end

  def create
    @leader = Leader.new(leader_params)
    unless @leader.save
      load_meet_types
      render 'new'
      return
    end

    @leader.meet_types = MeetType.find(params[:meet_type_id]) if params[:meet_type_id]

    if @leader.save
      redirect_to leaders_path
    else
      load_meet_types
      render 'new'
    end
  end

  def edit; end

  def update
    # raise params.inspect
    if params[:meet_type_id]
      @leader.meet_types = MeetType.find(params[:meet_type_id])
    else
      @leader.meet_types.destroy_all
    end
    if @leader.update(leader_params)
      redirect_to leaders_path
    else
      render 'edit'
    end
  end

  def show; end

  def index
    @leaders = Leader.active.in_order
  end

  def destroy
    # as Leaders will now expire, rather than being deleted, we shouldn't need
    # to remove the joins from Leader to MeetType
    # @leader.meet_types.destroy_all
    @leader.destroy

    redirect_to leaders_path
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
