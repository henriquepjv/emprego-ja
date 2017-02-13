class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @companies = Company.all
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to job_url(@job.id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end
end
