class CarouselsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_carousel, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_carousels, only: [:index]

  def index
  end

  def show
  end

  def new
    @carousel = current_user.carousels.new
  end

  def edit
  end

  def create
    @carousel = current_user.carousels.new(carousel_params)

    if @carousel.save
      flash[:success] = "创建成功"
      redirect_to carousel_path(@carousel)
    else
      render :new
    end
  end
  
  def update
    if @carousel.update(carousel_params)
      flash[:success] = "更新成功"
      redirect_to carousel_path(@carousel)
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @carousel.destroy
    flash[:success] = "删除成功"
    redirect_to carousels_path
  end

  private
    def set_carousel
      @carousel = current_user.carousels.find(params[:id])
    end

    def carousel_params
      params.require(:carousel).permit(:name, :pic, :weight)
    end

    def set_carousels
      @carousels = current_user.carousels.page(params[:page])
    end
end
