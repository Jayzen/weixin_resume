module API
  module V1
    module Common
      class Pay < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'create directly pay'
        params do
          requires :price, type: String
          optional :remark, type: String
        end 
        post '/directly_pay' do
          validate_appkey
          current_account = {appid: @user.app_id, mch_id: @user.merchant_id, key: @user.merchant_key}.freeze
          if token = Redis.new.get(request.headers["Token"])
            openid = JSON.parse(token)["openid_message"]["openid"]
            weixin_params = {
              body: '直接支付',
              out_trade_no: ::User.generate_order_uuid,
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
            error!({code: 102, error: "不存在token"})
          end 
        end

        desc 'create directly pay record'
        params do
          requires :price, type: String
          optional :remark, type: String
          optional :pattern, type: String
        end
        post '/directly_pay_record' do
          validate_appkey
          if token = Redis.new.get(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @pay_record = ::PayRecord.create(user_id: @user.id, guest_id: guest_id, price: params[:price], remark: params[:remark], pattern: params[:pattern])
            if @pay_record.errors.messages.size != 0
              error!({code: 102, error:  @pay_record.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'get directly pay records'
        get '/directly_pay_records' do
          validate_appkey
          if token = Redis.new.get(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @pay_records = ::Guest.find(guest_id).pay_records.where(user_id: @user.id).order(created_at: :desc)
            pay_records = present @pay_records, with: API::Entities::PayRecord
            build_response code: 0, data: pay_records
          else
            error!({code: 102, error: "不存在token"})
          end
        end


        desc 'create order pay'
        params do
          requires :price, type: String
          requires :order_id, type: Integer
        end
        post '/order_pay' do
          validate_appkey
          current_account = {appid: @user.app_id, mch_id: @user.merchant_id, key: @user.merchant_key}.freeze
          if token = Redis.new.get(request.headers["Token"])
            openid = JSON.parse(token)["openid_message"]["openid"]
            order_no = @user.orders.find(params[:order_id]).order_no
            weixin_params = {
              body: '订单支付',
              out_trade_no: order_no,
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
            error!({code: 102, error: "不存在token"})
          end
        end 
      end
    end
  end
end
