class HomePhotographCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home_photograph_category, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_home_photograph_categories, only: [:index]
  before_action :set_photographs, only: [:new, :edit]
  access home_photograph_category: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @home_photograph_category = current_user.home_photograph_categories.new
  end

  def edit
  end

  def create
    @home_photograph_category = current_user.home_photograph_categories.new(home_photograph_category_params)

    if @home_photograph_category.save
      flash[:success] = "创建成功"
      redirect_to home_photograph_categories_path
    else
      render :new
    end
  end
  
  def update
    if @home_photograph_category.update(home_photograph_category_params)
      flash[:success] = "更新成功"
      redirect_to home_photograph_categories_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @home_photograph_category.destroy
    flash[:success] = "删除成功"
    redirect_to home_photograph_categories_path
  end

  private
    def set_home_photograph_category
      @home_photograph_category = current_user.home_photograph_categories.find(params[:id])
    end

    def home_photograph_category_params
      params.require(:home_photograph_category).permit(:name, :pic, :reveal, :order, :photograph_id)
    end
    
    def set_home_photograph_categories
      @home_photograph_categories = current_user.home_photograph_categories.order(order: :asc).page(params[:page])
    end

    def set_photographs
      @photographs = current_user.photographs
    end
end
