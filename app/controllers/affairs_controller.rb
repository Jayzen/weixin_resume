class AffairsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_products, only: [:new, :edit]
  before_action :set_affair, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_affairs, only: [:index]
  access affair: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @affair = current_user.affairs.new
  end

  def edit
  end

  def create
    @affair = current_user.affairs.new(affair_params)

    if @affair.save
      flash[:success] = "创建成功"
      redirect_to affairs_path
    else
      render :new
    end
  end
  
  def update
    if @affair.update(affair_params)
      flash[:success] = "更新成功"
      redirect_to affairs_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @affair.destroy
    flash[:success] = "删除成功"
    redirect_to affairs_path
  end

  private
    def set_affair
      @affair = current_user.affairs.find(params[:id])
    end

    def affair_params
      params.require(:affair).permit(:name, :reveal, :order, :product_id)
    end
    
    def set_affairs
      @affairs = current_user.affairs.order(order: :desc).page(params[:page])
    end

    def set_products
      @products = current_user.products
    end
end
