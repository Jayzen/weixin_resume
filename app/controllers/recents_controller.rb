class RecentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recent, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_recents, only: [:index]
  before_action :set_photographs, only: [:new, :edit]
  #access recent: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @recent = current_user.recents.new
  end

  def edit
  end

  def create
    @recent = current_user.recents.new(recent_params)

    if @recent.save
      flash[:success] = "创建成功"
      redirect_to recents_path
    else
      render :new
    end
  end
  
  def update
    if @recent.update(recent_params)
      flash[:success] = "更新成功"
      redirect_to recents_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @recent.destroy
    flash[:success] = "删除成功"
    redirect_to recents_path
  end

  private
    def set_recent
      @recent = current_user.recents.find(params[:id])
    end

    def recent_params
      params.require(:recent).permit(:name, :pic, :reveal, :order, :photograph_id)
    end
    
    def set_recents
      @recents = current_user.recents.order(order: :asc).page(params[:page])
    end

    def set_photographs
      @photographs = current_user.photographs
    end
end
