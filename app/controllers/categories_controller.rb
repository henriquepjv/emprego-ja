class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      if @category.save
        redirect_to @category
      else

        flash.now[:error] = 'Preencha com uma categoria!'
        render :new
      end
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end
