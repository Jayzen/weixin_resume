module API
  module V1
    module Common
      class Pay < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'create directly pay'
        params do
          requires :token, type: String
          requires :price, type: String
          optional :remark, type: String
        end 
        post '/directly_pay' do
          validate_appkey
          current_account = {appid: @user.app_id, mch_id: @user.merchant_id, key: @user.merchant_key}.freeze
          if Rails.cache.fetch(params["token"])
            openid = JSON.parse(Rails.cache.fetch(params["token"]))["openid_message"]["openid"]
            weixin_params = {
              body: '直接支付',
              out_trade_no: User.generate_order_uuid,
              total_fee: (params["price"].to_f*100).to_i,
              spbill_create_ip: '127.0.0.1',
              notify_url: 'http://making.dev/notify',
              trade_type: 'JSAPI',
              openid: openid
            }
            weixin_params_response = WxPay::Service.invoke_unifiedorder weixin_params, current_account.dup
            weixin_pay_params = {
              prepayid: weixin_params_response[:raw]["xml"]["prepay_id"],
              noncestr: SecureRandom.hex(16),
            }
            weixin_pay_response = WxPay::Service.generate_js_pay_req weixin_pay_params, current_account.dup
            weixin_pay_response
          else
            return "hello world"
          end 
        end

        desc 'create order pay'
        params do
          requires :token, type: String
          requires :price, type: String
        end
        post '/order_pay' do
          validate_appkey
          current_account = {appid: @user.app_id, mch_id: @user.merchant_id, key: @user.merchant_key}.freeze
          if Rails.cache.fetch(params["token"])
            openid = JSON.parse(Rails.cache.fetch(params["token"]))["openid_message"]["openid"]
            weixin_params = {
              body: '订单支付',
              out_trade_no: User.generate_order_uuid,
              total_fee: (params["price"].to_f*100).to_i,
              spbill_create_ip: '127.0.0.1',
              notify_url: 'http://making.dev/notify',
              trade_type: 'JSAPI',
              openid: openid
            }
            weixin_params_response = WxPay::Service.invoke_unifiedorder weixin_params, current_account.dup
            weixin_pay_params = {
              prepayid: weixin_params_response[:raw]["xml"]["prepay_id"],
              noncestr: SecureRandom.hex(16),
            }
            weixin_pay_response = WxPay::Service.generate_js_pay_req weixin_pay_params, current_account.dup
            weixin_pay_response
          else
            return "hello world"
          end
        end 
      end
    end
  end
end
