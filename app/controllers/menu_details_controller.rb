class MenuDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu
  before_action :set_menu_detail, only: [:show, :edit, :update, :destroy, :delete]
  access menu: :all, message: "当前用户无权访问"

  def index
    @menu_details = @menu.menu_details.order(order: :desc).page(params[:page])
  end

  def show
  end

  def new
    @menu_detail = @menu.menu_details.new
  end

  def create
    @menu_detail = @menu.menu_details.new(menu_detail_params)
    if @menu_detail.save
      flash[:success] = "创建成功"
      redirect_to menu_menu_details_path(@menu)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu_detail.update(menu_detail_params)
      flash[:success] = "更新成功"
      redirect_to menu_menu_details_path(@menu)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @menu_detail.destroy
    flash[:success] = "删除成功"
    redirect_to menu_menu_details_path(@menu)
  end 

  private
    def set_menu
      @menu = current_user.menus.find(params[:menu_id])
    end

    def set_menu_detail
      @menu_detail = @menu.menu_details.find(params[:id])
    end

    def menu_detail_params
      params.require(:menu_detail).permit(:title, :pic, :user_id, :order, :reveal)
    end
end
