module API
  module Helpers
    module Common
      extend ActiveSupport::Concern

      included do
        helpers do
          def build_response code: 0, data: nil
            { code: code, data: data }
          end
          
          def cache_value
            if token = request.headers["Token"]
              if Rails.cache.fetch(token)
                cache = JSON.parse(Rails.cache.fetch(token))
              else
                error!({code: 1, message: '缓存中不存在该token'}, 401)
              end
            else
              error!({code: 1, message: 'header中未传递token'}, 401)
            end
          end

          def create_or_update_guest_address(guest)
            if guest.guest_address
              guest.guest_address.update(name: params[:name], mobile: params[:mobile], province: params[:province], city: params[:city], country: params[:country], detail: params[:detail])
            else
              guest.create_guest_address(name: params[:name], mobile: params[:mobile], province: params[:province], city: params[:city], country: params[:country], detail: params[:detail])
            end
            build_response code: 0, data: guest.guest_address
          end

          def validate_order(products, user)
            #检查商品是否下架，如果上架，检查库存是否满足
            products.each do |product|
              unless user.products.find_by(id: product["product_id"])
                product_name = product["name"]
                show_name = product_name + '已经下架'
                error!({code: 1, error: show_name})
              else
                @stock = user.products.find_by(id: product["product_id"]).stock
                if @stock < product["count"]
                  product_name = product["name"]
                  show_name = product_name + '库存不足:' + '库存为' + @stock.to_s + ',' + '订单为'+ product["count"].to_s
                  error!({code: 1, error: show_name})
                end
              end
            end
          end

          def create_order(products, guest_id, user)
             #初始化参数
             order_product_ids = []
             order_products = products
             products.each do |product|
               order_product_ids << product["product_id"]
             end

             #创建订单
             stock_products = user.products.find(order_product_ids).pluck(:id, :current_price)
             total_price = 0
             total_count = 0

             #计算总价
             order_products.each_index do |index|
               total_price += order_products[index]["count"]*stock_products[index][1]*100
             end
             total_price = total_price/100
             
             #计算总的订单数
             order_products.each do |product|
               total_count += product["count"]
             end

             #获得订单地址
             guest_address = ::Guest.find(guest_id).guest_address
             if guest_address
               snap_address = guest_address.to_json(except: [:id, :user_id, :created_at, :updated_at])
             else
               error!({code: 1, error: '地址不存在'})
             end

             #获取snap_img和snap_name
             product = user.products.find(order_products[0]["product_id"])
             if product
               snap_img = product.pic
               snap_name = product.name
               if order_products.size > 1
                 snap_name = product.name + "等"
               else
                 snap_name = product.name
               end 
              else
               error!({code: 1, error: '商品不存在'})
             end

             #获取order_no和after_no
             order_no = ::User.generate_order_uuid
             after_no = ::User.generate_after_uuid

             order = user.orders.create(guest_id: guest_id, total_price: total_price, total_count: total_count, snap_address: snap_address, snap_name: snap_name, snap_img: snap_img, order_no: order_no, after_no: after_no)
             order_products.each do |product|
               order.order_products.create(product_id: product["product_id"], count: product["count"])
             end
             return order
          end

          def validate_appkey
            if request.headers["Appkey"] == "[object Undefined]"
              error!({code: 100, error: 'appkey不存在'})
            elsif User.find_by(appkey: request.headers["Appkey"]) == nil
              error!({code: 101, error: 'appkey不正确'})
            else
              @user = ::User.find_by(appkey: request.headers["Appkey"])
            end
          end
          
        end
      end
    end
  end
end
