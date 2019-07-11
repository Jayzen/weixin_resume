module API
  module V1
    module Common
      class HomeProduct < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find home products'
        get '/home_products' do
          validate_appkey
          @ids = @user.product_homes.includes(:product).where(reveal: true).order(order: :asc).pluck(:product_id)
          @products = @user.products.find(@ids)
          products = present @products, with: API::Entities::Product
          build_response code: 0, data: products
        end 
      end
    end
  end
end
