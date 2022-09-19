# frozen_string_literal: true

class MeetsController < ApplicationController
  before_action :load_meet, only: %i[edit show register update medical_conditions]

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

  def edit
    if @meet.rota_leaders.count.zero? && @meet.meet_type.present?
      MeetType.find(@meet.meet_type).meet_type_jobs.has_count.each do |mtj|
        mtj.count.times do
          @meet.rota_leaders.build(job: mtj.job)
        end
      end
    end

    @leaders = Leader.joins(:leader_meet_types).where(leader_meet_types: { meet_type_id: @meet.meet_type }).in_order
  end

  def update
    if @meet.update(meet_params)
      redirect_to @meet
    else
      render 'new'
    end
  end

  def register
    @children = @meet.children.in_order
    @carers = @meet.carers.in_order
    @leaders = @meet.leaders.in_order
  end

  def medical_conditions
    @children = @meet.children.with_condition.in_order
  end

  def show
    @leaders = @meet.rota_leaders.has_leader.by_leader.includes(:leader, :job).group_by(&:leader)
    # @leaders = @meet.rota_leaders.has_leader.includes(:leader,:job).
    #    sort_by{|l| l.leader.name}.
    #    group_by(&:leader)
  end

  def index
    @meets = Meet
    @meets = if params[:historic] == 'true'
               @meets.in_reverse.find_historic
             else
               @meets.in_order.find_future
             end
  end

  private

  def meet_params
    params.require(:meet).permit(:meet_date, :meet_type_id, rota_leaders_attributes: %i[id job_id leader_id])
  end

  def load_meet
    @meet = Meet.find(params[:id])
  end
end
