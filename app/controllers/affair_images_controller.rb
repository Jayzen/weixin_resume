class AffairImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_affair
  before_action :set_affair_image, only: [:show, :edit, :update, :destroy, :delete]
  #access affair_image: :all, message: "当前用户无权访问"

  def index
    @affair_images = @affair.affair_images.order(order: :asc).page(params[:page])
  end

  def show
  end

  def new
    @affair_image = @affair.affair_images.new
  end

  def create
    @affair_image = @affair.affair_images.new(affair_image_params)
    if @affair_image.save
      flash[:success] = "创建成功"
      redirect_to affair_affair_images_path(@affair)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @affair_image.update(affair_image_params)
      flash[:success] = "更新成功"
      redirect_to affair_affair_images_path(@affair)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @affair_image.destroy
    flash[:success] = "删除成功"
    redirect_to affair_affair_images_path(@affair)
  end 

  private
    def set_affair
      @affair = current_user.affairs.find(params[:affair_id])
    end

    def set_affair_image
      @affair_image = @affair.affair_images.find(params[:id])
    end

    def affair_image_params
      params.require(:affair_image).permit(:name, :pic, :user_id, :order, :reveal)
    end
end
