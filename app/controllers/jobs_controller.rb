class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end
  def show
    @job = Job.find(params[:id])
  end
  def new
    @job = Job.new
  end
  def create
    #adicionar codigo reduzido
    @job = Job.new
    @job.title = params[:job][:title]
    @job.location = params[:job][:location]
    @job.category = params[:job][:category]
    @job.company = params[:job][:company]
    @job.description = params[:job][:description]
    @job.featured = params[:job][:featured]
    @job.save
    redirect_to job_url(@job.id)
  end
end
