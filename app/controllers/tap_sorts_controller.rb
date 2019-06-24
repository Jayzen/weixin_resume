class TapSortsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tap_sort, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_tap_sorts, only: [:index]
  before_action :set_tap_carousels, only: [:new, :edit]
  #access tap_sort: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @tap_sort = current_user.tap_sorts.new
  end

  def edit
  end

  def create
    @tap_sort = current_user.tap_sorts.new(tap_sort_params)

    if @tap_sort.save
      flash[:success] = "创建成功"
      redirect_to tap_sorts_path
    else
      render :new
    end
  end
  
  def update
    if @tap_sort.update(tap_sort_params)
      flash[:success] = "更新成功"
      redirect_to tap_sorts_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @tap_sort.destroy
    flash[:success] = "删除成功"
    redirect_to tap_sorts_path
  end

  private
    def set_tap_sort
      @tap_sort = current_user.tap_sorts.find(params[:id])
    end

    def tap_sort_params
      params.require(:tap_sort).permit(:name, :pic, :reveal, :weight, :tap_carousel_id)
    end

    def set_tap_sorts
      @tap_sorts = current_user.tap_sorts.page(params[:page])
    end

    def set_tap_carousels
      @tap_carousels = current_user.tap_carousels
    end
end
