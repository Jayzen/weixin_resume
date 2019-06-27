class MerchantImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant_image, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_merchant_images, only: [:index]
  access merchant_image: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @merchant_image = current_user.merchant_images.new
  end

  def edit
  end

  def create
    @merchant_image = current_user.merchant_images.new(merchant_image_params)

    if @merchant_image.save
      flash[:success] = "创建成功"
      redirect_to merchant_images_path
    else
      render :new
    end
  end
  
  def update
    if @merchant_image.update(merchant_image_params)
      flash[:success] = "更新成功"
      redirect_to merchant_images_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @merchant_image.destroy
    flash[:success] = "删除成功"
    redirect_to merchant_images_path
  end

  private
    def set_merchant_image
      @merchant_image = current_user.merchant_images.find(params[:id])
    end

    def merchant_image_params
      params.require(:merchant_image).permit(:name, :pic, :reveal, :weight)
    end

    def set_merchant_images
      @merchant_images = current_user.merchant_images.page(params[:page])
    end
end
