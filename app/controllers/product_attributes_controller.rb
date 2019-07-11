class ProductAttributesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_product_attribute, only: [:show, :edit, :update, :destroy, :delete]
  #access product: :all, message: "当前用户无权访问"

  def index
    @product_attributes = @product.product_attributes.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @product_attribute = @product.product_attributes.new
  end

  def create
    @product_attribute = @product.product_attributes.new(product_attribute_params)
    if @product_attribute.save
      flash[:success] = "创建成功"
      redirect_to product_product_attributes_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product_attribute.update(product_attribute_params)
      flash[:success] = "更新成功"
      redirect_to product_product_attributes_path(@product)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @product_attribute.destroy
    flash[:success] = "删除成功"
    redirect_to product_product_attributes_path(@product)
  end 

  private
    def set_product
      @product = current_user.products.find(params[:product_id])
    end

    def set_product_attribute
      @product_attribute = @product.product_attributes.find(params[:id])
    end

    def product_attribute_params
      params.require(:product_attribute).permit(:name, :content, :user_id, :order, :reveal)
    end
end
