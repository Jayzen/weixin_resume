module API
  module V1
    module Common
      class Affair < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find location'
        get '/affairs' do
          validate_appkey
          @affairs = @user.affairs.includes(:affair_images, [affair_comments: :guest], :product).where(reveal: true).order(order: :desc)
          affairs = present @affairs, with: API::Entities::Affair
          build_response code: 0, data: affairs
        end

        desc 'create affair comment'
        params do
          requires :content, type: String
          requires :affair_id, type: Integer
        end
        post '/affair_comment' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @affair_comment = ::AffairComment.create(guest_id: guest_id, affair_id: params[:affair_id], content: params[:content])
            if @affair_comment.errors.messages.size != 0
              error!({code: 102, error:  @affair_comment.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'delete affair comment'
        delete '/affair_comment/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @affair_comment = Guest.find(guest_id).affair_comments.find(params[:id])
            @affair_comment.destroy
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'find specific affiar'
        get '/affair/:id' do
          validate_appkey
          @affair = @user.affairs.includes(:affair_images, [affair_comments: :guest], :guests, :product).where(reveal: true).find(params[:id])
          @affair.view = @affair.view + 1
          @affair.save
          affair = present @affair, with: API::Entities::AffairDetail
          build_response code: 0, data: affair
        end

        desc 'create affair like'
        params do
          requires :affair_id, type: Integer
        end
        post '/affair_like' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @affair_like = ::AffairLike.create(guest_id: guest_id, affair_id: params[:affair_id])
            if @affair_like.errors.messages.size != 0
              error!({code: 102, error:  @affair_like.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'delete affair like'
        delete '/affair_like/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @affair_like = Guest.find(guest_id).affair_likes.find_by(affair_id: params[:id])
            @affair_like.destroy
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'create affair share'
        params do
          requires :affair_id, type: Integer
        end
        post '/affair_share' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @affair_share = ::AffairShare.create(guest_id: guest_id, affair_id: params[:affair_id])
            if @affair_share.errors.messages.size != 0
              error!({code: 102, error:  @affair_share.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'judge like status'
        get '/judge_like/:id' do
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            like_status = Guest.find(guest_id).affair_likes.pluck(:affair_id).include?(params[:id].to_i)
            build_response code: 0, data: like_status
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'judge like status'
        get '/judge_likes' do
          if token = Rails.cache.fetch(request.headers["Token"])
            validate_appkey
            @affairs = @user.affairs.includes(:affair_likes).order(order: :desc)
            @guest_id = JSON.parse(token)["guest_id"]
            likes_status = []
            @affairs.each do |affair|
              if affair.affair_likes.pluck(:guest_id).include?(@guest_id)
                likes_status << true
              else
                likes_status << false
              end
            end
            build_response code: 0, data: likes_status
          else
            error!({code: 102, error: "不存在token"})
          end
        end
      end
    end
  end
end
