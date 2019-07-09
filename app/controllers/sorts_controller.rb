class SortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sort, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_sorts, only: [:index]
  #access product: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @sort = current_user.sorts.new
  end

  def edit
  end

  def create
    @sort = current_user.sorts.new(sort_params)

    if @sort.save
      flash[:success] = "创建成功"
      redirect_to sorts_path
    else
      render :new
    end
  end
  
  def update
    if @sort.update(sort_params)
      flash[:success] = "更新成功"
      redirect_to sorts_path
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @sort.destroy
    flash[:success] = "删除成功"
    redirect_to sorts_path
  end

  private
    def set_sort
      @sort = current_user.sorts.find(params[:id])
    end

    def sort_params
      params.require(:sort).permit(:name, :reveal, :order)
    end

    def set_sorts
      @sorts = current_user.sorts.page(params[:page])
    end
end
