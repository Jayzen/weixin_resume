class PhotographsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photograph, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_photographs, only: [:index]
  access photograph: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @photograph = current_user.photographs.new
  end

  def edit
  end

  def create
    @photograph = current_user.photographs.new(photograph_params)

    if @photograph.save
      flash[:success] = "创建成功"
      redirect_to photographs_path
    else
      render :new
    end
  end
  
  def update
    if @photograph.update(photograph_params)
      flash[:success] = "更新成功"
      redirect_to photographs_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @photograph.destroy
    flash[:success] = "删除成功"
    redirect_to photographs_path
  end

  private
    def set_photograph
      @photograph = current_user.photographs.find(params[:id])
    end

    def photograph_params
      params.require(:photograph).permit(:name, :big_pic, :small_pic, :order, :price, :others, :merit, :age, :clothing, :picture, :photographer, :reveal)
    end

    def set_photographs
      @photographs = current_user.photographs.page(params[:page])
    end
end
