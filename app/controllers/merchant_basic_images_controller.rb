class MerchantBasicImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant_basic
  before_action :set_merchant_basic_image, only: [:show, :edit, :update, :destroy, :delete]
  access merchant_basic: :all, message: "当前用户无权访问"

  def index
    @merchant_basic_images = @merchant_basic.merchant_basic_images.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @merchant_basic_image = @merchant_basic.merchant_basic_images.new
  end

  def create
    @merchant_basic_image = @merchant_basic.merchant_basic_images.new(merchant_basic_image_params)
    if @merchant_basic_image.save
      flash[:success] = "创建成功"
      redirect_to merchant_basic_merchant_basic_images_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @merchant_basic_image.update(merchant_basic_image_params)
      flash[:success] = "更新成功"
      redirect_to merchant_basic_merchant_basic_images_path
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @merchant_basic_image.destroy
    flash[:success] = "删除成功"
    redirect_to merchant_basic_merchant_basic_images_path
  end 

  private
    def set_merchant_basic
      @merchant_basic = current_user.merchant_basic
    end

    def set_merchant_basic_image
      @merchant_basic_image = @merchant_basic.merchant_basic_images.find(params[:id])
    end

    def merchant_basic_image_params
      params.require(:merchant_basic_image).permit(:name, :pic, :user_id, :order, :reveal)
    end
end
