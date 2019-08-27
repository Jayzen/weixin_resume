class ProductRecommendsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new, :edit, :create, :update]
  before_action :set_product_recommend, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_product_recommends, only: [:index]
  access product_recommend: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @product_recommend = current_user.product_recommends.new
  end

  def edit
  end

  def create
    @product_recommend = current_user.product_recommends.new(product_recommend_params)

    if @product_recommend.save
      flash[:success] = "创建成功"
      redirect_to product_recommends_path
    else
      render :new
    end
  end
  
  def update
    if @product_recommend.update(product_recommend_params)
      flash[:success] = "更新成功"
      redirect_to product_recommends_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @product_recommend.destroy
    flash[:success] = "删除成功"
    redirect_to product_recommends_path
  end

  private
    def set_product_recommend
      @product_recommend = current_user.product_recommends.find(params[:id])
    end

    def product_recommend_params
      params.require(:product_recommend).permit(:reveal, :order, :product_id)
    end
    
    def set_product_recommends
      @product_recommends = current_user.product_recommends.order(order: :desc).page(params[:page])
    end

    def set_products
      @products = current_user.products
    end
end
