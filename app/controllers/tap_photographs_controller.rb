class TapPhotographsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tap_photograph, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_tap_photographs, only: [:index]
  before_action :set_tap_carousels, only: [:new, :edit, :create, :update]
  access tap_photograph: :all, message: "当前用户无权访问"
  def index
  end

  def show
  end

  def new
    @tap_photograph = current_user.tap_photographs.new
  end

  def edit
  end

  def create
    @tap_photograph = current_user.tap_photographs.new(tap_photograph_params)

    if @tap_photograph.save
      flash[:success] = "创建成功"
      redirect_to tap_photographs_path
    else
      render :new
    end
  end
  
  def update
    if @tap_photograph.update(tap_photograph_params)
      flash[:success] = "更新成功"
      redirect_to tap_photographs_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @tap_photograph.destroy
    flash[:success] = "删除成功"
    redirect_to tap_photographs_path
  end

  private
    def set_tap_photograph
      @tap_photograph = current_user.tap_photographs.find(params[:id])
    end

    def tap_photograph_params
      params.require(:tap_photograph).permit(:name, :pic, :reveal, :order, :tap_carousel_id)
    end

    def set_tap_photographs
      @tap_photographs = current_user.tap_photographs.page(params[:page])
    end

    def set_tap_carousels
      @tap_carousels = current_user.tap_carousels
    end
end
