class AffairCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_affair
  before_action :set_affair_comment, only: [:show, :edit, :update, :destroy, :delete]
  #access affair_comment: :all, message: "当前用户无权访问"

  def index
    @affair_comments = @affair.affair_comments.page(params[:page])
  end

  def show
  end

  def new
    @affair_comment = @affair.affair_comments.new
  end

  def create
    @affair_comment = @affair.affair_comments.new(affair_comment_params)
    if @affair_comment.save
      flash[:success] = "创建成功"
      redirect_to affair_affair_comments_path(@affair)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @affair_comment.update(affair_comment_params)
      flash[:success] = "更新成功"
      redirect_to affair_affair_comments_path(@affair)
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @affair_comment.destroy
    flash[:success] = "删除成功"
    redirect_to affair_affair_comments_path(@affair)
  end 

  private
    def set_affair
      @affair = current_user.affairs.find(params[:affair_id])
    end

    def set_affair_comment
      @affair_comment = @affair.affair_comments.find(params[:id])
    end

    def affair_comment_params
      params.require(:affair_comment).permit(:content, :guest_id, :reveal)
    end
end
