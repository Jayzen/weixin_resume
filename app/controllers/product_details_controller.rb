class ProductDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_product_detail, only: [:show, :edit, :update, :destroy, :delete]
  #access product: :all, message: "当前用户无权访问"

  def index
    @product_details = @product.product_details.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @product_detail = @product.product_details.new
  end

  def create
    @product_detail = @product.product_details.new(product_detail_params)
    if @product_detail.save
      flash[:success] = "创建成功"
      redirect_to product_product_details_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_detail.update(product_detail_params)
      flash[:success] = "更新成功"
      redirect_to product_product_details_path(@product)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @product_detail.destroy
    flash[:success] = "删除成功"
    redirect_to product_product_details_path(@product)
  end 

  private
    def set_product
      @product = current_user.products.find(params[:product_id])
    end

    def set_product_detail
      @product_detail = @product.product_details.find(params[:id])
    end

    def product_detail_params
      params.require(:product_detail).permit(:title, :pic, :user_id, :order, :reveal)
    end
end
