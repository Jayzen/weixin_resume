class GuestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest, only: [:destroy, :delete]
  access guest: :all, message: "当前用户无权访问"

  def index
    @guests = current_user.guests.page(params[:page])
  end

  def delete
  end

  def destroy
    @guest.destroy
    redirect_to guests_url, notice: '删除成功'
  end

  private
    def set_guest
      @guest = current_user.guests.find(params[:id])
    end
end
