class AffairCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_affair
  before_action :set_affair_comment, only: [:show, :edit, :update, :destroy, :delete]
  access affair: :all, message: "当前用户无权访问"

  def index
    @affair_comments = @affair.affair_comments.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @affair_comment.update(content: params[:affair_comment][:content], reveal: params[:affair_comment][:reveal])
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
end
