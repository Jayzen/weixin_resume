class TapPhotographImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tap_photograph
  before_action :set_tap_photograph_image, only: [:show, :edit, :update, :destroy, :delete]
  #access tap_photograph: :all, message: "当前用户无权访问"

  def index
    @tap_photograph_images = @tap_photograph.tap_photograph_images.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @tap_photograph_image = @tap_photograph.tap_photograph_images.new
  end

  def create
    @tap_photograph_image = @tap_photograph.tap_photograph_images.new(tap_photograph_image_params)
    if @tap_photograph_image.save
      flash[:success] = "创建成功"
      redirect_to tap_photograph_tap_photograph_images_path(@tap_photograph)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tap_photograph_image.update(tap_photograph_image_params)
      flash[:success] = "更新成功"
      redirect_to tap_photograph_tap_photograph_images_path(@tap_photograph)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @tap_photograph_image.destroy
    flash[:success] = "删除成功"
    redirect_to tap_photograph_tap_photograph_images_path(@tap_photograph)
  end 

  private
    def set_tap_photograph
      @tap_photograph = current_user.tap_photographs.find(params[:tap_photograph_id])
    end

    def set_tap_photograph_image
      @tap_photograph_image = @tap_photograph.tap_photograph_images.find(params[:id])
    end

    def tap_photograph_image_params
      params.require(:tap_photograph_image).permit(:name, :pic, :user_id, :order, :reveal)
    end
end
