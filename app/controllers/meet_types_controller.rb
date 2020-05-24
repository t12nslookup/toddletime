class MeetTypesController < ApplicationController
  before_action :load_meet_type, only: %i[update edit show]

  def new
    @meet_type = MeetType.new

    Job.all.each do |job|
      @meet_type.meet_type_jobs.build(job: job, count: 0)
    end
    @meet_type.meet_type_jobs.sort_by{ |mtj| mtj.job.name }
  end

  def create
    @meet_type = MeetType.new(meet_type_params)

    if @meet_type.save
      redirect_to meet_types_path
    else
      render 'new'
    end
  end

  def edit
    (Job.all - @meet_type.jobs).each do |job|
      @meet_type.meet_type_jobs.build(job: job, count: 0)
    end
    @meet_type.meet_type_jobs.sort_by{ |mtj| mtj.job.name }
  end

  def update
    if @meet_type.update(meet_type_params)
      redirect_to meet_types_path
    else
      render 'edit'
    end
  end

  def show; end

  def index
    @meet_types = MeetType.in_order
  end

  private

  def meet_type_params
    params.require(:meet_type).permit(:name, meet_type_jobs_attributes: [:id, :job_id, :count])
  end

  def load_meet_type
    @meet_type = MeetType.find(params[:id])
  end
end
