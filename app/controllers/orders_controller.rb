class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest
  before_action :set_order, only: [:destroy, :deletei, :show]
  access guest: :all, message: "当前用户无权访问"

  def index
    @orders = @guest.orders.order(created_at: :desc).page(params[:page])
  end

  def delete
  end

  def show
    @order_products = @order.order_products.includes(:product).page(params[:page])
  end

  def destroy
    @order.destroy
    flash[:success] = "删除成功"
    redirect_to guest_orders_path(@guest)
  end 

  private
    def set_guest
      @guest = current_user.guests.find(params[:guest_id])
    end

    def set_order
      @order = @guest.orders.find(params[:id])
    end
end
