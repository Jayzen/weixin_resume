class TopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_top, only: [:show, :edit, :update, :destroy, :delete, :set_weight]
  before_action :set_tops, only: [:index]
  access top: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @top = current_user.tops.new
  end

  def edit
  end

  def create
    @top = current_user.tops.new(top_params)

    if @top.save
      flash[:success] = "创建成功"
      redirect_to tops_path
    else
      render :new
    end
  end
  
  def update
    if @top.update(top_params)
      flash[:success] = "更新成功"
      redirect_to tops_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @top.destroy
    flash[:success] = "删除成功"
    redirect_to tops_path
  end

  def set_weight
    @top.update(weight: Time.now, reveal: true)
    flash[:success] = "权重更新成功"
    redirect_to tops_path
  end 

  private
    def set_top
      @top = current_user.tops.find(params[:id])
    end

    def top_params
      params.require(:top).permit(:name, :pic, :reveal, :weight)
    end

    def set_tops
      @top = current_user.tops.where(reveal: true).order(weight: :desc).first
      @tops = current_user.tops.order(weight: :desc).page(params[:page])
    end
end
