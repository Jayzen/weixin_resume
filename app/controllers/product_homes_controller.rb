class ProductHomesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new, :edit, :create, :update]
  before_action :set_product_home, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_product_homes, only: [:index]
  #access product_home: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product_home = current_user.product_homes.new
  end

  def edit
  end

  def create
    @product_home = current_user.product_homes.new(product_home_params)

    if @product_home.save
      flash[:success] = "创建成功"
      redirect_to product_homes_path
    else
      render :new
    end
  end
  
  def update
    if @product_home.update(product_home_params)
      flash[:success] = "更新成功"
      redirect_to product_homes_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product_home.destroy
    flash[:success] = "删除成功"
    redirect_to product_homes_path
  end

  private
    def set_product_home
      @product_home = current_user.product_homes.find(params[:id])
    end

    def product_home_params
      params.require(:product_home).permit(:reveal, :order, :product_id)
    end
    
    def set_product_homes
      @product_homes = current_user.product_homes.order(order: :desc).page(params[:page])
    end

    def set_products
      @products = current_user.products
    end
end
