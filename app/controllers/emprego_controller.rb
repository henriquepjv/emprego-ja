class EmpregoController < ApplicationController

  def index
    @job = Job.all
  end
end
