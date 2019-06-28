module API
  module V1
    class Mall < Grape::API
      include Default
      include Grape::Rails::Cache

      before do
        validate_appkey
      end

      desc 'find independent carousels'
      get '/independent_carousels' do
        @carousels = @user.independent_carousels.where(reveal: true).order(order: :asc)
        carousels = present @carousels, with: API::Entities::IndependentCarousel
        build_response code: 0, data: carousels
      end

      desc 'find merchant basic'
      get '/merchant_basic' do
        @basic = @user.merchant_basic
        basic = present @basic, with: API::Entities::MerchantBasic
        build_response code: 0, data: basic
      end

      desc 'find home products'
      get '/home_products' do
        @products = @user.products.where(reveal: true, set_home: true).order(order: :asc)
        products = present @products, with: API::Entities::Product
        build_response code: 0, data: products
      end

      desc 'find home images'
      get '/merchant_images' do
        @merchant_images = @user.merchant_images.where(reveal: true).order(order: :asc)
        merchant_images = present @merchant_images, with: API::Entities::MerchantImage
        build_response code: 0, data: merchant_images
      end 

      desc 'find specific product'
      get 'products/:id' do
        @product = @user.products.find(params[:id])
        product = present @product, with: API::Entities::Product
        build_response code: 0, data: product
      end
    end
  end
end
