class ProductLimitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new, :edit, :create, :update]
  before_action :set_product_limit, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_product_limits, only: [:index]
  access product_limit: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product_limit = current_user.product_limits.new
  end

  def edit
  end

  def create
    @product_limit = current_user.product_limits.new(product_limit_params)

    if @product_limit.save
      flash[:success] = "创建成功"
      redirect_to product_limits_path
    else
      render :new
    end
  end
  
  def update
    if @product_limit.update(product_limit_params)
      flash[:success] = "更新成功"
      redirect_to product_limits_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product_limit.destroy
    flash[:success] = "删除成功"
    redirect_to product_limits_path
  end

  private
    def set_product_limit
      @product_limit = current_user.product_limits.find(params[:id])
    end

    def product_limit_params
      params.require(:product_limit).permit(:reveal, :order, :product_id, :limit)
    end
    
    def set_product_limits
      @product_limits = current_user.product_limits.order(order: :desc).page(params[:page])
    end

    def set_products
      @products = current_user.products
    end
end
