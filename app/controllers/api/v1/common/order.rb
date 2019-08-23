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
            requires :name, type: String
          end
        end
        post '/order' do
          cache = cache_value
          guest_id = cache["guest_id"]
          validate_order(params["products"], @user)
          @order = create_order(params["products"], guest_id, @user)
          order = present @order, with: API::Entities::Order
          build_response code: 0, data: order
        end

        desc 'get guest orders'
        get '/orders' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @orders = @user.guests.find(guest_id).orders.includes(:order_products, :products).order(created_at: :desc)
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
          @orders = @user.guests.find(guest_id).orders.where(status: 2, after_status: params[:after_status]).order(created_at: :desc)
          orders = present @orders, with: API::Entities::Order
          build_response code: 0, data: orders
        end

        desc 'get order by order id'
        get '/orders/:order_id' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order =  @user.guests.find(guest_id).orders.find(params[:order_id])
          order = present @order, with: API::Entities::Order
          build_response code: 0, data: order
        end

        desc 'change to wait pay status'
        params do 
          requires :order_id, type: Integer
        end
        post '/wait_pay_status' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order = @user.guests.find(guest_id).orders.find(params[:order_id])
          @order.status = 1
          @order.save
        end

        desc 'change to paid status'
        params do
          requires :order_id, type: Integer
        end
        post '/paid_status' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order = @user.guests.find(guest_id).orders.find(params[:order_id])
          @order.status = 2
          @order.save
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
        end

        desc 'change specific order account'
        params do
          requires :order_id, type: Integer
          requires :account, type: Float
        end
        post '/change_order_account' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order = @user.guests.find(guest_id).orders.find(params[:order_id])
          @order.total_price = params[:account]
          @order.save
        end

        desc 'change specific order remark to group'
        params do 
          requires :order_id, type: Integer
        end
        post 'change_remark_to_group' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order = @user.guests.find(guest_id).orders.find(params[:order_id])
          @order.remark = 1
          @order.save
        end

        desc 'change specific order remark to bargain'
        params do
          requires :order_id, type: Integer
        end
        post 'change_remark_to_bargain' do
          cache = cache_value
          guest_id = cache["guest_id"]
          @order = @user.guests.find(guest_id).orders.find(params[:order_id])
          @order.remark = 2
          @order.save
        end
      end
    end
  end
end
