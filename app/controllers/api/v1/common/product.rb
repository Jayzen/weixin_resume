module API
  module V1
    module Common
      class Product < Grape::API
        include Default
        include Grape::Rails::Cache

        before do
          validate_appkey
        end

        desc 'find product groups'
        get '/product_groups' do
          @product_groups = @user.product_groups.includes(:product).where(reveal: true).order(order: :asc)
          product_groups = present @product_groups, with: API::Entities::ProductGroup
        end

        desc 'find product bargains'
        get '/product_bargains' do
          @product_bargains = @user.product_bargains.includes(:product).where(reveal: true).order(order: :asc)
          product_bargains = present @product_bargains, with: API::Entities::ProductBargain
        end 

        desc 'find specific product group'
        get '/product_groups/:id' do
          @product_group = @user.product_groups.includes(:product, :product_group_orders).where(reveal: true).order(order: :asc).find(params[:id])
          @product = @product_group.product
          @product.view = @product.view + 1
          @product.save
          product_group = present @product_group, with: API::Entities::ProductGroupDetail
        end

        desc 'find specific product bargain'
        get '/product_bargains/:id' do
          @product_bargain = @user.product_bargains.includes(:product).where(reveal: true).order(order: :asc).find(params[:id])
          @product = @product_bargain.product
          @product.view = @product.view + 1
          @product.save
          product_bargain = present @product_bargain, with: API::Entities::ProductBargainDetail
        end 

        desc 'find specific product group order'
        get '/product_group_orders/:id' do
          @product_group_order = ::ProductGroupOrder.find(params[:id])
          product_group_order = present @product_group_order, with: API::Entities::ProductGroupOrder
        end

        desc 'find specific product bargain order'
        get '/product_bargain_orders/:product_bargain_id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_bargain_order = ::ProductBargainOrder.includes(:guest).where(product_bargain_id: params[:product_bargain_id], guest_id: guest_id)
            product_bargain_order = present @product_bargain_order, with: API::Entities::ProductBargainOrder
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'find specific product bargain order by id'
        get '/product_bargain_orders_by_id/:id' do
          @product_bargain_order = ::ProductBargainOrder.includes(:guest).find(params[:id])
          product_bargain_order = present @product_bargain_order, with: API::Entities::ProductBargainOrder
        end

        desc 'create product group order'
        params do
          requires :product_group_id, type: Integer
        end
        post '/product_group_order' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_group_order = ::ProductGroupOrder.create(guest_id: guest_id, product_group_id: params[:product_group_id])
            if @product_group_order.errors.messages.size != 0
              error!({code: 102, error:  @product_group_order.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'create product bargain order'
        params do
          requires :product_bargain_id, type: Integer
        end
        post '/product_bargain_order' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_bargain_order = ::ProductBargainOrder.create(guest_id: guest_id, product_bargain_id: params[:product_bargain_id])
            if @product_bargain_order.errors.messages.size != 0
              error!({code: 102, error:  @product_bargain_order.errors.messages.values.flatten.first})
            end
            product_bargain_order = present @product_bargain_order, with: API::Entities::ProductBargainOrder
          else
            error!({code: 102, error: "不存在token"})
          end
        end 
        
        desc 'create product group order join'
        params do
          requires :product_group_order_id, type: Integer
        end
        post '/product_group_order_join' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_group_order_join = ::ProductGroupOrderJoin.create(guest_id: guest_id, product_group_order_id: params[:product_group_order_id])
            if @product_group_order_join.errors.messages.size != 0
              error!({code: 102, error:  @product_group_order_join.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end 

        desc 'create product bargain order join'
        params do
          requires :product_bargain_order_id, type: Integer
        end
        post '/product_bargain_order_join' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_bargain_order_join = ::ProductBargainOrderJoin.create(guest_id: guest_id, product_bargain_order_id: params[:product_bargain_order_id])
            if @product_bargain_order_join.errors.messages.size != 0
              error!({code: 102, error:  @product_bargain_order_join.errors.messages.values.flatten.first})
            end
            product_bargain_order_join = present @product_bargain_order_join, with: API::Entities::ProductBargainOrderJoin
          else
            error!({code: 102, error: "不存在token"})
          end
        end 

        desc 'find products'
        get '/products' do
          @products = @user.products.where(reveal: true).order(order: :asc)
          products = present @products, with: API::Entities::Product
        end 

        desc 'search products'
        get '/products/search?' do
          name = params["q"].strip
          start = params["start"].to_i || 0
          @return_products = @user.products.where(["name like ?", "%#{name}%"]).where(reveal: true).order(order: :asc)
          @total = @return_products.size
          @products = @return_products.limit(20).offset(start)
          products = present @products, with: API::Entities::Product
        end

        desc 'find specific product'
        get 'products/:id' do
          @product = @user.products.includes(:product_images, :product_details, [product_comments: :guest], [product_likes: :guest]).find(params[:id])
          @product.view = @product.view + 1
          @product.save
          product = present @product, with: API::Entities::ProductDetail
          build_response code: 0, data: product
        end

        desc 'create product comment'
        params do
          requires :content, type: String
          requires :product_id, type: Integer
        end
        post '/product_comment' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_comment = ::ProductComment.create(guest_id: guest_id, product_id: params[:product_id], content: params[:content])
            if @product_comment.errors.messages.size != 0
              error!({code: 102, error:  @product_comment.errors.messages.values.flatten.first})
            end
            product_comment = present @product_comment, with: API::Entities::ProductComment
            build_response code: 0, data: product_comment
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'delete product comment'
        delete '/product_comment/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_comment = @user.guests.find(guest_id).product_comments.find(params[:id])
            @product_comment.destroy
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'create product like'
        params do
          requires :product_id, type: Integer
        end
        post '/product_like' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_like = ::ProductLike.create(guest_id: guest_id, product_id: params[:product_id])
            if @product_like.errors.messages.size != 0
              error!({code: 102, error:  @product_like.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'delete product like'
        delete '/product_like/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_like = @user.guests.find(guest_id).product_likes.find_by(product_id: params[:id])
            @product_like.destroy
          else
            error!({code: 102, error: "不存在token"})
          end
        end
        
        desc 'judge like status'
        get '/product_judge_like/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            like_status = @user.guests.find(guest_id).product_likes.pluck(:product_id).include?(params[:id].to_i)
            build_response code: 0, data: like_status
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'create product keep'
        params do
          requires :product_id, type: Integer
        end
        post '/product_keep' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_keep = ::ProductKeep.create(guest_id: guest_id, product_id: params[:product_id])
            if @product_keep.errors.messages.size != 0
              error!({code: 102, error:  @product_keep.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'delete product keep'
        delete '/product_keep/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @product_keep = @user.guests.find(guest_id).product_keeps.find_by(product_id: params[:id])
            @product_keep.destroy
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'judge keep status'
        get '/product_judge_keep/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            keep_status = @user.guests.find(guest_id).product_keeps.pluck(:product_id).include?(params[:id].to_i)
            build_response code: 0, data: keep_status
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'find guest keep products'
        get '/guest_keep_products' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            product_ids = @user.guests.find(guest_id).product_keeps.pluck(:product_id)
            @keep_products = ::Product.find(product_ids) 
            keep_products = present @keep_products, with: API::Entities::Product
          else
            error!({code: 102, error: "不存在token"})
          end
        end
      end
    end
  end
end
