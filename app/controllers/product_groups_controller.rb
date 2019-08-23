class ProductGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new, :edit, :create, :update]
  before_action :set_product_group, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_product_groups, only: [:index]
  #access product_group: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product_group = current_user.product_groups.new
  end

  def edit
  end

  def create
    @product_group = current_user.product_groups.new(product_group_params)

    if @product_group.save
      flash[:success] = "创建成功"
      redirect_to product_groups_path
    else
      render :new
    end
  end
  
  def update
    if @product_group.update(product_group_params)
      flash[:success] = "更新成功"
      redirect_to product_groups_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product_group.destroy
    flash[:success] = "删除成功"
    redirect_to product_groups_path
  end

  private
    def set_product_group
      @product_group = current_user.product_groups.find(params[:id])
    end

    def product_group_params
      params.require(:product_group).permit(:reveal, :order, :product_id, :price)
    end
    
    def set_product_groups
      @product_groups = current_user.product_groups.order(order: :desc).page(params[:page])
    end

    def set_products
      @products = current_user.products
    end
end
