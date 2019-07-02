class KeywordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_keyword, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_keywords, only: [:index]
  #access keyword: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @keyword = current_user.keywords.new
  end

  def edit
  end

  def create
    @keyword = current_user.keywords.new(keyword_params)

    if @keyword.save
      flash[:success] = "创建成功"
      redirect_to keywords_path
    else
      render :new
    end
  end
  
  def update
    if @keyword.update(keyword_params)
      flash[:success] = "更新成功"
      redirect_to keywords_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @keyword.destroy
    flash[:success] = "删除成功"
    redirect_to keywords_path
  end

  private
    def set_keyword
      @keyword = current_user.keywords.find(params[:id])
    end

    def keyword_params
      params.require(:keyword).permit(:name, :reveal, :order)
    end

    def set_keywords
      @keywords = current_user.keywords.page(params[:page])
    end
end
