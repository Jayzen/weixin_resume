class HomePhotographsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_home_photograph, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_home_photographs, only: [:index]
  before_action :set_tap_photographs, only: [:new, :edit]
  access home_photograph: :all, message: "当前用户无权访问"
  def index
  end

  def show
  end

  def new
    @home_photograph = current_user.home_photographs.new
  end

  def edit
  end

  def create
    @home_photograph = current_user.home_photographs.new(home_photograph_params)

    if @home_photograph.save
      flash[:success] = "创建成功"
      redirect_to home_photographs_path
    else
      render :new
    end
  end
  
  def update
    if @home_photograph.update(home_photograph_params)
      flash[:success] = "更新成功"
      redirect_to home_photographs_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @home_photograph.destroy
    flash[:success] = "删除成功"
    redirect_to home_photographs_path
  end

  private
    def set_home_photograph
      @home_photograph = current_user.home_photographs.find(params[:id])
    end

    def home_photograph_params
      params.require(:home_photograph).permit(:name, :pic, :reveal, :weight, :tap_photograph_id)
    end

    def set_home_photographs
      @home_photographs = current_user.home_photographs.page(params[:page])
    end

    def set_tap_photographs
      @tap_photographs = current_user.tap_photographs
    end
end
