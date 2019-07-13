module API
  module V1
    module Common
      class Sort < Grape::API
        include Default
        include Grape::Rails::Cache

        before do
          validate_appkey
        end 

        desc 'find product sorts'
        get '/product_sorts' do
          @sorts = @user.sorts.includes(:products).where(reveal: true).order(order: :asc)
          sorts = present @sorts, with: API::Entities::Sort
          build_response code: 0, data: sorts
        end 
        
        desc 'find specific produc_sort products'
        get '/product_sorts/:id' do
          @sort = @user.sorts.includes(:products).where(reveal: true).find(params[:id])
          sort = present @sort, with: API::Entities::SortDetail
          build_response code: 0, data: sort
        end

        desc 'find first produc_sort products'
        get '/product_sorts/first' do
          if @sort = @user.sorts.where(reveal: true).first
            @products = @sort.products.where(reveal: true).order(order: :asc)
            products = present @products, with: API::Entities::Product
            build_response code: 0, data: products
          else
            sort = present @sort, with: API::Entities::Sort
            build_response code: 0, data: sort
          end
        end
      end
    end
  end
end
