class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_guest
  before_action :set_order, only: [:destroy, :delete, :show, :refund, :refuse_refund, :revert_refund, :deliver_goods]
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

  def refund
    #certificate的值必须是本地地址，而不是网络地址
    temp_dir = __dir__.split("/")
    temp_dir.pop(2)
    dir = temp_dir.join("/") + "/public"
    WxPay.set_apiclient_by_pkcs12(File.read(dir+current_user.certificate.url), current_user.merchant_id)
    options = {apiclient_cert: WxPay.apiclient_cert, ssl_client_key: WxPay.apiclient_key}
    current_account = {appid: current_user.app_id, mch_id: current_user.merchant_id, key: current_user.merchant_key}.merge(options).freeze
    weixin_params = {
      out_refund_no: User.generate_order_uuid,
      total_fee: Integer(@order.total_price.to_f*100),
      refund_fee: Integer(@order.total_price.to_f*100),
      op_user_id: nil,
      out_trade_no: @order.order_no
    }
    WxPay::Service.invoke_refund weixin_params, current_account.dup
    @order.after_status = 2
    @order.save
    flash[:success] = "退款成功"
    redirect_to guest_order_path(@guest, @order)
  end

  def refuse_refund
    @order.after_status = 3
    @order.save
    flash[:success] = "退款失败"
    redirect_to guest_order_path(@guest, @order)
  end

  def revert_refund
    @order.after_status = 0
    @order.save
    flash[:success] = "返回至支付状态"
    redirect_to guest_order_path(@guest, @order)
  end

  def deliver_goods
    @order.status = 3
    @order.save
    flash[:success] = "订单发货"
    redirect_to guest_order_path(@guest, @order)
  end

  private
    def set_guest
      @guest = current_user.guests.find(params[:guest_id])
    end

    def set_order
      @order = @guest.orders.find(params[:id])
    end
end
