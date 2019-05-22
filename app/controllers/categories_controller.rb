class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_categories, only: [:index]

  def index
  end

  def show
  end

  def new
    @category = current_user.categories.new
  end

  def edit
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      flash[:success] = "创建成功"
      redirect_to categories_path
    else
      render :new
    end
  end
  
  def update
    if @category.update(category_params)
      flash[:success] = "更新成功"
      redirect_to categories_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @category.destroy
    flash[:success] = "删除成功"
    redirect_to categories_path
  end

  private
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :big_pic, :small_pic, :order, :price, :content)
    end

    def set_categories
      @categories = current_user.categories.page(params[:page])
    end
end
