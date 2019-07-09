class ProductSortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sort
  before_action :set_products, only: [:new, :create]
  before_action :set_product_sort, only: [:destroy, :delete]
  #access sort: :all, message: "当前用户无权访问"

  def index
    @product_sorts = @sort.product_sorts.includes(:product).order(order: :desc).page(params[:page])
  end

  def new
    @product_sort = @sort.product_sorts.new
  end

  def create
    @product_sort = @sort.product_sorts.new(product_sort_params)
    begin
      @product_sort.save
      flash[:success] = "创建成功"
      redirect_to sort_product_sorts_path(@sort)
    rescue ActiveRecord::RecordNotUnique => e
      flash[:danger] = "不能提交重复商品"
      redirect_to sort_product_sorts_path(@sort), danger: "不能提交重复数据"
    end
  end

  def delete
  end

  def destroy
    @product_sort.destroy
    flash[:success] = "删除成功"
    redirect_to sort_product_sorts_path(@sort)
  end 

  private
    def set_sort
      @sort = current_user.sorts.find(params[:sort_id])
    end

    def set_product_sort
      @product_sort = @sort.product_sorts.find(params[:id])
    end

    def product_sort_params
      params.require(:product_sort).permit(:product_id, :order, :user_id)
    end

    def set_products
      @products = current_user.products
    end
end
