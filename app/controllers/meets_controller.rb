class MeetsController < ApplicationController

  before_action :load_meet, only: [:edit, :show, :register]

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
    if (@meet.leader_to_meets.count == 0)
      MeetType.find(@meet.meet_type).meet_type_jobs.has_count.each do |mtj|
        mtj.count.times do
          @meet.leader_to_meets.build(job: mtj.job)
        end
      end
    end

    @leaders = Leader.joins(:leader_meet_types).where(leader_meet_types: {meet_type_id: @meet.meet_type})
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
#    @carers = @meet.carers.in_order
  end

  def show
  end

  def index
    @meets = Meet.in_order
    if params[:historic] == "true"
      @meets = @meets.find_historic
    else
      @meets = @meets.find_future
    end
  end

  private
    def meet_params
      params.require(:meet).permit(:meet_date, :meet_type_id)
    end

    def load_meet
      @meet = Meet.find(params[:id])
    end
end
