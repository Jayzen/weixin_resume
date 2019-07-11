class BannerItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:create, :new, :edit, :update]
  before_action :set_banner
  before_action :set_banner_item, only: [:show, :edit, :update, :destroy, :delete]
  access banner: :all, message: "当前用户无权访问"

  def index
    @banner_items = @banner.banner_items.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @banner_item = @banner.banner_items.new
  end

  def create
    @banner_item = @banner.banner_items.new(banner_item_params)
    if @banner_item.save
      flash[:success] = "创建成功"
      redirect_to banner_banner_items_path(@banner)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @banner_item.update(banner_item_params)
      flash[:success] = "更新成功"
      redirect_to banner_banner_items_path(@banner)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @banner_item.destroy
    flash[:success] = "删除成功"
    redirect_to banner_banner_items_path(@banner)
  end 

  private
    def set_banner
      @banner = current_user.banners.find(params[:banner_id])
    end

    def set_banner_item
      @banner_item = @banner.banner_items.find(params[:id])
    end

    def banner_item_params
      params.require(:banner_item).permit(:name, :pic, :user_id, :order, :reveal, :product_id)
    end

    def set_products
      @products = current_user.products
    end
end
