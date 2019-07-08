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
        @ids = @user.product_homes.includes(:product).where(reveal: true).order(order: :asc).pluck(:product_id)
        @products = @user.products.find(@ids)
        products = present @products, with: API::Entities::Product
        build_response code: 0, data: products
      end

      desc 'find products'
      get '/products' do
        @products = @user.products.where(reveal: true).order(order: :asc)
        products = present @products, with: API::Entities::Product
        #build_response code: 0, data: products
      end 

      desc 'search products'
      get '/products/search?' do
        name = params["q"].strip
        start = params["start"].to_i || 0
        @return_products = @user.products.where(["name like ?", "%#{name}%"]).where(reveal: true).order(order: :asc)
        @total = @return_products.size
        @products = @return_products.limit(20).offset(start)
        products = present @products, with: API::Entities::Product
        #products = present @products, with: API::Entities::Product
        #build_response code: 0, data: products
      end

      desc 'find home images'
      get '/merchant_images' do
        @merchant_images = @user.merchant_images.where(reveal: true).order(order: :asc)
        merchant_images = present @merchant_images, with: API::Entities::MerchantImage
        build_response code: 0, data: merchant_images
      end 

      desc 'find specific product'
      get 'products/:id' do
        @product = @user.products.includes(:product_images, :product_details).find(params[:id])
        product = present @product, with: API::Entities::Product
        build_response code: 0, data: product
      end

      desc 'find product sorts'
      get '/product_sorts' do
        @product_sorts = @user.product_sorts.where(reveal: true).order(order: :asc)
        product_sorts = present @product_sorts, with: API::Entities::ProductSort
        build_response code: 0, data: product_sorts
      end

      desc 'find first produc_sort products'
      get '/product_sorts/first' do
        if @product_sort = @user.product_sorts.where(reveal: true).first
          @products = @product_sort.products.where(reveal: true).order(order: :asc)
          products = present @products, with: API::Entities::Product
          build_response code: 0, data: products
        else
          product_sort = present @product_sort, with: API::Entities::ProductSort
          build_response code: 0, data: product_sort
        end
      end 

      desc 'find specific produc_sort products'
      get '/product_sorts/:id' do
        @product_sort = @user.product_sorts.where(reveal: true).find(params[:id])
        @products = @product_sort.products.where(reveal: true).order(order: :asc)
        products = present @products, with: API::Entities::Product
        build_response code: 0, data: products
      end

      desc 'find all keywords'
      get '/hot_words' do
        @hot_words = @user.hot_words.where(reveal: true).order(order: :asc)
        hot_words = present @hot_words, with: API::Entities::Keyword
        build_response code: 0, data: hot_words
      end
    end
  end
end
