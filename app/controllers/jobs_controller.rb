class JobsController < ApplicationController
  before_action :load_job, only: %i[update edit]

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render 'edit'
    end
  end

  def index
    @jobs = Job.in_order
  end

  private

  def job_params
    params.require(:job).permit(:name)
  end

  def load_job
    @job = Job.find(params[:id])
  end
end
