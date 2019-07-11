class ProductThemesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theme
  before_action :set_products, only: [:new, :create]
  before_action :set_product_theme, only: [:destroy, :delete]
  access theme: :all, message: "当前用户无权访问"

  def index
    @product_themes = @theme.product_themes.includes(:product).order(order: :desc).page(params[:page])
  end

  def new
    @product_theme = @theme.product_themes.new
  end

  def create
    @product_theme = @theme.product_themes.new(product_theme_params)
    begin
      @product_theme.save
      flash[:success] = "创建成功"
      redirect_to theme_product_themes_path(@theme)
    rescue ActiveRecord::RecordNotUnique => e
      flash[:danger] = "不能提交重复商品"
      redirect_to theme_product_themes_path(@theme), danger: "不能提交重复数据"
    end
  end

  def delete
  end

  def destroy
    @product_theme.destroy
    flash[:success] = "删除成功"
    redirect_to theme_product_themes_path(@theme)
  end 

  private
    def set_theme
      @theme = current_user.themes.find(params[:theme_id])
    end

    def set_product_theme
      @product_theme = @theme.product_themes.find(params[:id])
    end

    def product_theme_params
      params.require(:product_theme).permit(:product_id, :order, :user_id)
    end

    def set_products
      @products = current_user.products
    end
end
