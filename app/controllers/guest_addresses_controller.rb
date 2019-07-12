class GuestAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest
  before_action :set_guest_address, only: [:delete, :destroy, :show]
  access guest: :all, message: "当前用户无权访问"

  def show
  end

  def delete
  end

  def destroy
    @guest_address.destroy
    flash[:success] = "删除成功"
    redirect_to guests_path
  end 

  private
    def set_guest
      @guest = current_user.guests.find(params[:guest_id])
    end

    def set_guest_address
      @guest_address = @guest.guest_address
    end
end
