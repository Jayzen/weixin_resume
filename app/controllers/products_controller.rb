class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_products, only: [:index]
  #access product: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product = current_user.products.new
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)

    if @product.save
      flash[:success] = "创建成功"
      redirect_to products_path
    else
      render :new
    end
  end
  
  def update
    if @product.update(product_params)
      flash[:success] = "更新成功"
      redirect_to products_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product.destroy
    flash[:success] = "删除成功"
    redirect_to products_path
  end

  private
    def set_product
      @product = current_user.products.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :pic, :order, :price, :reveal, :set_home)
    end

    def set_products
      @products = current_user.products.page(params[:page])
    end
end
