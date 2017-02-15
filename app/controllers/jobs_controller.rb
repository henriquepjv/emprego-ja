class JobsController < ApplicationController
  before_action :job_find , only:[:show , :edit , :update]

  def index
    @jobs = Job.all
    @companies = Company.all
  end

  def show
    @companies = Company.find(params[:id])
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
    @companies = Company.all
  end

  def update
    @companies = Company.all
    if @job.update(job_params)
      redirect_to @job
    else
      flash.now[:error] = 'Não foi possível atualizar a vaga'
      render :edit
    end

  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :category, :company_id, :description, :featured)
  end

  def job_find
    @job = Job.find(params[:id])
  end
end
