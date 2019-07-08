class ThemesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_theme, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_themes, only: [:index]
  #access theme: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @theme = current_user.themes.new
  end

  def edit
  end

  def create
    @theme = current_user.themes.new(theme_params)

    if @theme.save
      flash[:success] = "创建成功"
      redirect_to themes_path
    else
      render :new
    end
  end
  
  def update
    if @theme.update(theme_params)
      flash[:success] = "更新成功"
      redirect_to themes_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @theme.destroy
    flash[:success] = "删除成功"
    redirect_to themes_path
  end

  private
    def set_theme
      @theme = current_user.themes.find(params[:id])
    end

    def theme_params
      params.require(:theme).permit(:name, :home_pic, :theme_pic, :reveal, :order)
    end

    def set_themes
      @themes = current_user.themes.page(params[:page])
    end
end
