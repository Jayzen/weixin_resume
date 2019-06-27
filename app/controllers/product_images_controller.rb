class ProductImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_product_image, only: [:show, :edit, :update, :destroy, :delete]
  #access product: :all, message: "当前用户无权访问"

  def index
    @product_images = @product.product_images.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @product_image = @product.product_images.new
  end

  def create
    @product_image = @product.product_images.new(product_image_params)
    if @product_image.save
      flash[:success] = "创建成功"
      redirect_to product_product_images_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_image.update(product_image_params)
      flash[:success] = "更新成功"
      redirect_to product_product_images_path(@product)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @product_image.destroy
    flash[:success] = "删除成功"
    redirect_to product_product_images_path(@product)
  end 

  private
    def set_product
      @product = current_user.products.find(params[:product_id])
    end

    def set_product_image
      @product_image = @product.product_images.find(params[:id])
    end

    def product_image_params
      params.require(:product_image).permit(:title, :pic, :user_id, :order, :reveal)
    end
end
