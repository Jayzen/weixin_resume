class HeadersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_header, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_headers, only: [:index]
  #access header: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @header = current_user.headers.new
  end

  def edit
  end

  def create
    @header = current_user.headers.new(header_params)

    if @header.save
      flash[:success] = "创建成功"
      redirect_to header_path(@header)
    else
      render :new
    end
  end
  
  def update
    if @header.update(header_params)
      flash[:success] = "更新成功"
      redirect_to header_path(@header)
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @header.destroy
    flash[:success] = "删除成功"
    redirect_to headers_path
  end

  private
    def set_header
      @header = current_user.headers.find(params[:id])
    end

    def header_params
      params.require(:header).permit(:name, :pic, :reveal, :weight)
    end

    def set_headers
      @headers = current_user.headers.page(params[:page])
    end
end
