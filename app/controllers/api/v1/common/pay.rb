module API
  module V1
    module Common
      class Pay < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'directly pay'
        params do
          #requires :token, type: String
          requires :price, type: String
          requires :remark, type: String
        end
        post '/directly_pay' do
          debugger
          validate_appkey
          current_account = {appid: @user.app_id, mch_id: @user.merchant_id, key: @user.merchant_key}.freeze
          if Rails.cache.fetch(params["token"])
            openid = JSON.parse(Rails.cache.fetch(params["token"]))["openid_message"]["openid"]
            params = {
              body: '直接支付',
              out_trade_no: 'test demo',
              total_fee: (params["price"].to_f*100).to_i,
              spbill_create_ip: '127.0.0.1',
              notify_url: 'http://making.dev/notify',
              trade_type: 'JSAPI',
              openid: openid
            }
            r = WxPay::Service.invoke_unifiedorder params, current_account.dup
          else
            return "hello world"
          end
        end
      end
    end
  end
end
