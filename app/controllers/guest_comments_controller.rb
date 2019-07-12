class GuestCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest
  before_action :set_guest_comment, only: [:destroy, :delete]
  access guest: :all, message: "当前用户无权访问"

  def index
    @guest_comments = @guest.affair_comments.order(created_at: :desc).page(params[:page])
  end

  def delete
  end

  def destroy
    @guest_comment.destroy
    flash[:success] = "删除成功"
    redirect_to guest_guest_comments_path(@guest)
  end 

  private
    def set_guest
      @guest = current_user.guests.find(params[:guest_id])
    end

    def set_guest_comment
      @guest_comment = @guest.affair_comments.find(params[:id])
    end
end
