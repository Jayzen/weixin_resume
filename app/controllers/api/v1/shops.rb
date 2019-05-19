module API
  module V1
    class Shops < Grape::API
      include Default
      include Grape::Rails::Cache

      desc 'find basic'
      get '/basic' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @basic = @user.basic
        @basic.visit = @basic.visit+1
        @basic.save
        basic = present @basic, with: API::Entities::Basic
        build_response code: 0, data: basic
      end

      desc 'find location'
      get '/location' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @location = @user.location
        location = present @location, with: API::Entities::Location
        build_response code: 0, data: location
      end

      desc 'get openid'
      params do
        requires :code, type: String
      end
      post '/token/achieve' do
        openid_message = Guest.get_openid(params[:code])
        if openid_message["errcode"]
          error!({code: 1, message: 'opendid获取错误'})
        else
          if @guest = Guest.find_by(openid: openid_message["openid"])
            guest_id = @guest.id
          else
            @guest = Guest.create(openid: openid_message["openid"])
            guest_id = @guest.id
          end
          token = Guest.generate_token(32)
          cache(key: token, expires_in: 12.hours) do
            { openid_message: openid_message, guest_id: guest_id }
          end
          {token: token}
        end
      end

      desc 'verify token'
      params do
        requires :token, type: String
      end
      post '/token/verify' do
        if Rails.cache.fetch(params[:token])
          {isValid: true}
        else
          {isValid: false}
        end
      end

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

      desc 'create client'
      params do 
        requires :name, type: String, allow_blank: false
        requires :contact, type: String, allow_blank: false
      end
      post 'client' do
        Client.create(name: params[:name], contact: params[:contact])
      end
    end
  end
end
