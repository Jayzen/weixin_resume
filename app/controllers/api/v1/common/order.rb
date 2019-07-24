module API
  module V1
    module Common
      class Order < Grape::API
        include Default
        include Grape::Rails::Cache

        before do
          validate_appkey
        end  
      
        desc 'post order'
        params do
          #参数验证{"products": [{"product_id": 2, "count": 1}, {"product_id": 2, "count": 3}]}
          requires :products, type: Array do
            requires :product_id, type: Integer
            requires :count, type: Integer
          end
        end
        post '/order' do
          cache = cache_value
          guest_id = cache["guest_id"]
          validate_order(params["products"], @user)
          create_order(params["products"], guest_id, @user)
        end

        desc 'get guest orders'
        get '/orders' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @orders = @user.guests.find(guest_id).orders.order(created_at: :desc)
          orders = present @orders, with: API::Entities::Order
          build_response code: 0, data: orders
        end

        desc 'get specific orders'
        get '/order/:status' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @orders = @user.guests.find(guest_id).orders.where(status: params[:status]).order(created_at: :desc)
          orders = present @orders, with: API::Entities::Order
          build_response code: 0, data: orders
        end

        desc 'get orders by order after status'
        get '/after_order/:after_status' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @orders = @user.guests.find(guest_id).orders.where(status: 1, after_status: params[:after_status]).order(created_at: :desc)
          orders = present @orders, with: API::Entities::Order
          build_response code: 0, data: orders
        end

        desc 'change order after status'
        params do 
          requires :order_id, type: Integer
        end
        post '/change_after_status' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order = @user.guests.find(guest_id).orders.find(params[:order_id])
          @order.after_status = 1
          @order.save
          @orders = @user.guests.find(guest_id).orders.where(status: 1).order(created_at: :desc)
          orders = present @orders, with: API::Entities::Order
          build_response code: 0, data: orders
        end
      end
    end
  end
end
