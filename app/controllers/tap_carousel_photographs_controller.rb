class TapCarouselPhotographsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tap_carousel_photograph, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_tap_carousel_photographs, only: [:index]
  before_action :set_tap_carousels, only: [:new, :edit]
  access tap_carousel: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def detail
    @tap_carousel_photograph = current_user.tap_carousel_photographs.find(params[:id])
    @tap_carousel_details = @tap_carousel_photograph.tap_carousel_details
  end

  def new_detail
    @tap_carousel_detail = current_user.tap_carousel_details.new
  end

  def show_detail
    @tap_carousel_photograph = current_user.tap_carousel_photographs.find(params[:id])
    @tap_carousel_detail = @tap_carousel_photograph.tap_carousel_details.find(params[:tap_carousel_detail])
  end

  def delete_detail
    @tap_carousel_photograph = current_user.tap_carousel_photographs.find(params[:id])
    @tap_carousel_detail = @tap_carousel_photograph.tap_carousel_details.find(params[:tap_carousel_detail])
    @tap_carousel_detail.destroy
    flash[:success] = "删除成功"
    redirect_to detail_tap_carousel_photograph_path
  end

  def create_detail
    @tap_carousel_photograph = current_user.tap_carousel_photographs.find(params[:id])
    @tap_carousel_detail = current_user.tap_carousel_details.new(
      title: params[:tap_carousel_detail][:title],
      pic: params[:tap_carousel_detail][:pic],
      reveal: params[:tap_carousel_detail][:reveal],
      order: params[:tap_carousel_detail][:order],
      tap_carousel_photograph_id: params[:id]
    )
    if @tap_carousel_detail.save
      flash[:success] = "创建成功"
      redirect_to detail_tap_carousel_photograph_path
    else
      render :new_detail
    end
  end 

  def new
    @tap_carousel_photograph = current_user.tap_carousel_photographs.new
  end

  def edit
  end

  def create
    @tap_carousel_photograph = current_user.tap_carousel_photographs.new(tap_carousel_photograph_params)

    if @tap_carousel_photograph.save
      flash[:success] = "创建成功"
      redirect_to tap_carousel_photograph_path(@tap_carousel_photograph)
    else
      render :new
    end
  end
  
  def update
    if @tap_carousel_photograph.update(tap_carousel_photograph_params)
      flash[:success] = "更新成功"
      redirect_to tap_carousel_photograph_path(@tap_carousel_photograph)
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @tap_carousel_photograph.destroy
    flash[:success] = "删除成功"
    redirect_to tap_carousel_photographs_path
  end

  private
    def set_tap_carousel_photograph
      @tap_carousel_photograph = current_user.tap_carousel_photographs.find(params[:id])
    end

    def tap_carousel_photograph_params
      params.require(:tap_carousel_photograph).permit(:tap_carousel_id, :name, :home_pic, :category_pic, :reveal, :weight)
    end

    def set_tap_carousel_photographs
      @tap_carousel_photographs = current_user.tap_carousel_photographs.page(params[:page])
    end

    def set_tap_carousels
      @tap_carousels = current_user.tap_carousels
    end
end
