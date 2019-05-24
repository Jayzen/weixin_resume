module API
  module V1
    class Resume < Grape::API
      include Default
      include Grape::Rails::Cache

      desc 'update guest'
      params do
        requires :token, type: String
      end
      post '/guest/update' do
        if token = Rails.cache.fetch(params[:token])
          guest_id = JSON.parse(token)["guest_id"]
          Guest.find(guest_id).update(nickname: params[:nickname], avatar: params[:avatar])
        end
      end

      desc 'create comment'
      params do
        requires :token, type: String
        requires :content, type: String
      end
      post '/comment' do
        if token = Rails.cache.fetch(params[:token])
          guest_id = JSON.parse(token)["guest_id"]
          user_id = User.find_by(appkey: request.headers["Appkey"]).id
          Comment.create(guest_id: guest_id, user_id: user_id, content: params[:content])
        end
      end

      desc 'get all comments'
      get '/comments' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @comments = @user.comments.includes(:guest)
        comments = present @comments, with: API::Entities::Comment
        build_response code: 0, data: comments
      end
    end
  end
end
