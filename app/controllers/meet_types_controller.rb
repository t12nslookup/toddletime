class MeetTypesController < ApplicationController
  before_action :load_meet_type, only: [:update, :edit, :show, :jobs]

  def new
    @meet_type = MeetType.new

    Job.all.each do |job|
      @meet_type.meet_type_jobs.build(job: job, count: 0)
    end
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
  end

  def update
    #raise @meet_type.inspect

    if @meet_type.update(meet_type_params)
      redirect_to meet_types_path
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @meet_types = MeetType.in_order
    @meet_types.each do |meet_type|
      meet_type.meet_type_jobs.each do |mtj|
        mtj.delete if mtj.count <= 0
      end
    end
  end

private
  def meet_type_params
    params.require(:meet_type).permit(:name, meet_type_jobs_attributes: [:id, :job_id, :count])
  end

  def load_meet_type
    @meet_type = MeetType.find(params[:id])
  end
end
