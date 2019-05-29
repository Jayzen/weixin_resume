class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:delete, :destroy, :show, :privileges, :update_privilege]
  access root_admin: :all, message: "当前用户无权访问"

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email], name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      flash[:success] = "创建成功"
      redirect_to admins_path
    else
      render :new
    end
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

  def privileges
  end

  def update_privilege
    basic = params[:privilege][:basic] ? :basic : nil
    location = params[:privilege][:location] ? :location :nil
    comment = params[:privilege][:comment] ? :comment : nil
    carousel = params[:privilege][:carousel] ? :carousel : nil
    photograph = params[:privilege][:photograph] ? :photograph : nil
    consult = params[:privilege][:consult] ? :consult : nil
    appointment = params[:privilege][:appointment] ? :appointment : nil
    wedding_basic = params[:privilege][:wedding_basic] ? :wedding_basic : nil
    @user.roles = [basic, location, comment, carousel, photograph, consult, appointment, wedding_basic].compact
    @user.save

    flash[:success] = "权限更新成功"
    redirect_to privileges_admin_path(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
