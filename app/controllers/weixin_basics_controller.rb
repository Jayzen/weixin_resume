class WeixinBasicsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(app_id: params[:user][:app_id], 
                        app_secret: params[:user][:app_secret], 
                        merchant: params[:user][:merchant],
                        merchant_key: params[:user][:merchant_key],
                        merchant_id: params[:user][:merchant_id],
                        certificate: params[:user][:certificate]
                       )
    flash[:success] = "更新成功"
    redirect_to weixin_basic_path
  end
end
