class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_menus, only: [:index]
  #access menu: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def menu_detail
    @menu = Menu.find(params[:id])
  end

  def new
    @menu = current_user.menus.new
  end

  def edit
  end

  def create
    @menu = current_user.menus.new(menu_params)

    if @menu.save
      flash[:success] = "创建成功"
      redirect_to menus_path
    else
      render :new
    end
  end
  
  def update
    if @menu.update(menu_params)
      flash[:success] = "更新成功"
      redirect_to menus_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @menu.destroy
    flash[:success] = "删除成功"
    redirect_to menus_path
  end

  private
    def set_menu
      @menu = current_user.menus.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :content, :pic, :order, :price, :reveal)
    end

    def set_menus
      @menus = current_user.menus.page(params[:page])
    end
end
