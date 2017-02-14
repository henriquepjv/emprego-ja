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
    @companies = Company.all
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job

    else
      flash.now[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
    @companies = Company.all
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to @job
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end
end
