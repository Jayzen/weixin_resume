class TapCarouselsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tap_carousel, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_tap_carousels, only: [:index]
  access tap_carousel: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @tap_carousel = current_user.tap_carousels.new
  end

  def edit
  end

  def create
    @tap_carousel = current_user.tap_carousels.new(tap_carousel_params)

    if @tap_carousel.save
      flash[:success] = "创建成功"
      redirect_to tap_carousel_path(@tap_carousel)
    else
      render :new
    end
  end
  
  def update
    if @tap_carousel.update(tap_carousel_params)
      flash[:success] = "更新成功"
      redirect_to tap_carousel_path(@tap_carousel)
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @tap_carousel.destroy
    flash[:success] = "删除成功"
    redirect_to tap_carousels_path
  end

  private
    def set_tap_carousel
      @tap_carousel = current_user.tap_carousels.find(params[:id])
    end

    def tap_carousel_params
      params.require(:tap_carousel).permit(:name, :pic, :reveal, :weight)
    end

    def set_tap_carousels
      @tap_carousels = current_user.tap_carousels.page(params[:page])
    end
end
