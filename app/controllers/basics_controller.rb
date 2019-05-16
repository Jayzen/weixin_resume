class BasicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basic, only: [:edit, :update, :destroy, :delete]

  def index
    @basics = current_user.basics.order("created_at desc").page(params[:page]).per(20)
  end

  def show
    @basic = current_user.basics.find(params[:id])
  end

  def new
    @basic = current_user.basics.new
  end

  def edit
  end

  def create
    @basic = current_user.basics.new(basic_params)

    if @basic.save
      flash[:success] = "文章创建成功"
      redirect_to basic_path(@basic)
    else
      render :new
    end
  end

  def update
    if @basic.update(basic_params)
      flash[:success] = "文章更新成功"
      redirect_to basic_path(@basic)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @basic.destroy
    flash[:success] = "文章删除成功"
    redirect_to basics_path
  end

  private
    def set_basic
      @basic = current_user.basics.find(params[:id])
    end

    def basic_params
      params.require(:basic).permit(:name, :motto, :introduce, :phone, :avatar,
                                    :wechat, :email, :company, :job, :position)
    end
end
