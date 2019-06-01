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
    @menu = current_user.menus.find(params[:id])
    @menu_details = @menu.menu_details
  end

  def new_detail
    @menu_detail = current_user.menu_details.new
  end

  def show_detail
    @menu = current_user.menus.find(params[:id])
    @menu_detail = @menu.menu_details.find(params[:menu_detail])
  end

  def delete_detail
    @menu = current_user.menus.find(params[:id])
    @menu_detail = @menu.menu_details.find(params[:menu_detail])
    @menu_detail.destroy
    flash[:success] = "删除成功"
    redirect_to menu_detail_menu_path
  end

  def create_detail
    @menu = current_user.menus.find(params[:id])
    @menu_detail = current_user.menu_details.new(
      title: params[:menu_detail][:title],
      pic: params[:menu_detail][:pic],
      reveal: params[:menu_detail][:reveal],
      order: params[:menu_detail][:order],
      menu_id: params[:id]
    )
    if @menu_detail.save
      flash[:success] = "创建成功"
      redirect_to menu_detail_menu_path
    else
      render :new_detail
    end
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
