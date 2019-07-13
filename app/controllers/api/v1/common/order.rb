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
      end
    end
  end
end
