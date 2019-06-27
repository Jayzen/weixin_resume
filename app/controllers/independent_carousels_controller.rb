class IndependentCarouselsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_independent_carousel, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_independent_carousels, only: [:index]
  #access independent_carousel: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @independent_carousel = current_user.independent_carousels.new
  end

  def edit
  end

  def create
    @independent_carousel = current_user.independent_carousels.new(independent_carousel_params)

    if @independent_carousel.save
      flash[:success] = "创建成功"
      redirect_to independent_carousels_path
    else
      render :new
    end
  end
  
  def update
    if @independent_carousel.update(independent_carousel_params)
      flash[:success] = "更新成功"
      redirect_to independent_carousels_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @independent_carousel.destroy
    flash[:success] = "删除成功"
    redirect_to independent_carousels_path
  end

  private
    def set_independent_carousel
      @independent_carousel = current_user.independent_carousels.find(params[:id])
    end

    def independent_carousel_params
      params.require(:independent_carousel).permit(:name, :pic, :reveal, :weight)
    end

    def set_independent_carousels
      @independent_carousels = current_user.independent_carousels.page(params[:page])
    end
end
