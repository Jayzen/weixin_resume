class MerchantBasicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant_basic, only: [:show, :edit, :update]
  access merchant_basic: :all, message: "当前用户无权访问"

  def show
  end

  def edit
  end

  def update
    if @merchant_basic.update(merchant_basic_params)
      flash[:success] = "更新成功"
      redirect_to merchant_basic_path
    else
      render :edit
    end
  end

  private
    def set_merchant_basic
      @merchant_basic = current_user.merchant_basic
    end

    def merchant_basic_params
      params.require(:merchant_basic).permit(:name, :phone, :avatar, :description, :duty, :is_wifi, :is_parking, :is_wechat_pay, :is_alipay)
    end
end
