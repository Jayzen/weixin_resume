class ProductBargainsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new, :edit, :create, :update]
  before_action :set_product_bargain, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_product_bargains, only: [:index]
  #access product_bargain: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product_bargain = current_user.product_bargains.new
  end

  def edit
  end

  def create
    @product_bargain = current_user.product_bargains.new(product_bargain_params)

    if @product_bargain.save
      flash[:success] = "创建成功"
      redirect_to product_bargains_path
    else
      render :new
    end
  end
  
  def update
    if @product_bargain.update(product_bargain_params)
      flash[:success] = "更新成功"
      redirect_to product_bargains_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product_bargain.destroy
    flash[:success] = "删除成功"
    redirect_to product_bargains_path
  end

  private
    def set_product_bargain
      @product_bargain = current_user.product_bargains.find(params[:id])
    end

    def product_bargain_params
      params.require(:product_bargain).permit(:reveal, :order, :product_id, :price)
    end
    
    def set_product_bargains
      @product_bargains = current_user.product_bargains.order(order: :desc).page(params[:page])
    end

    def set_products
      @products = current_user.products
    end
end
