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

      desc 'find carousels'
      get '/carousels' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @carousels = @user.carousels
        carousels = present @carousels, with: API::Entities::Carousel
        build_response code: 0, data: carousels
      end

      desc 'find categories'
      get '/categories' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @categories = @user.categories
        categories = present @categories, with: API::Entities::Category
        build_response code: 0, data: categories
      end

      desc 'find one category'
      get 'categories/:id' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @category = @user.categories.find(params[:id])
        category = present @category, with: API::Entities::Category
        build_response code: 0, data: category
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
      post '/client' do
        Client.create(name: params[:name], contact: params[:contact])
      end

      desc 'create consult'
      params do 
        requires :name, type: String, allow_blank: false
        requires :contact, type: String, allow_blank: false
      end
      post '/consult' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @user.consults.create(name: params[:name], contact: params[:contact])
      end

      desc 'create appointment'
      params do
        requires :name, type: String, allow_blank: false
        requires :contact, type: String, allow_blank: false
        requires :content, type: String, allow_blank: false
      end
      post '/appointment' do
        @user = User.find_by(appkey: request.headers["Appkey"])
        @user.appointments.create(name: params[:name], contact: params[:contact], content: params[:content])
      end
    end
  end
end
