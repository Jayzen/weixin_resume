class BannersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_banner, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_banners, only: [:index]
  #access banner: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @banner = current_user.banners.new
  end

  def edit
  end

  def create
    @banner = current_user.banners.new(banner_params)

    if @banner.save
      flash[:success] = "创建成功"
      redirect_to banners_path
    else
      render :new
    end
  end
  
  def update
    if @banner.update(banner_params)
      flash[:success] = "更新成功"
      redirect_to banners_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @banner.destroy
    flash[:success] = "删除成功"
    redirect_to banners_path
  end

  private
    def set_banner
      @banner = current_user.banners.find(params[:id])
    end

    def banner_params
      params.require(:banner).permit(:name)
    end

    def set_banners
      @banners = current_user.banners.page(params[:page])
    end
end
