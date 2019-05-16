class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:delete, :destroy, :show]

  access root_admin: :all, message: "当前用户无权访问"

  def index
    @users = User.all.page(params[:page])
  end

  def show
  end
  
  def delete
  end

  def search
    term = params[:name].strip
    @users = User.where('name LIKE ?', "%#{term}%").page(params[:page])
    render 'index'
  end

  def destroy
    @user.destroy
    flash[:success] = "用户删除成功"
    redirect_to admins_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
