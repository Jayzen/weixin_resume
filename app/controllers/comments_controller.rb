class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:delete, :destroy]

  def index
    @comments = current_user.comments.includes(:guest).order(created_at: :desc).page(params[:page]).per(50)
  end

  def delete
  end

  def destroy
    @comment.destroy
    flash[:success] = "评论删除成功"
    redirect_to comments_path
  end

  private
    def set_comment
      @comment = current_user.comments.find(params[:id])
    end
end
