class ProductSortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product_sort, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_product_sorts, only: [:index]
  access product: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product_sort = current_user.product_sorts.new
  end

  def edit
  end

  def create
    @product_sort = current_user.product_sorts.new(product_sort_params)

    if @product_sort.save
      flash[:success] = "创建成功"
      redirect_to product_sorts_path
    else
      render :new
    end
  end
  
  def update
    if @product_sort.update(product_sort_params)
      flash[:success] = "更新成功"
      redirect_to product_sorts_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product_sort.destroy
    flash[:success] = "删除成功"
    redirect_to product_sorts_path
  end

  private
    def set_product_sort
      @product_sort = current_user.product_sorts.find(params[:id])
    end

    def product_sort_params
      params.require(:product_sort).permit(:name, :reveal, :weight)
    end

    def set_product_sorts
      @product_sorts = current_user.product_sorts.page(params[:page])
    end
end
