module API
  module V1
    module Common
      class Token < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'get openid'
        params do
          requires :code, type: String
        end
        post '/token/achieve' do
          validate_appkey
          openid_message = @user.get_openid(params[:code])
          if openid_message["errcode"]
            error!({code: 1, message: 'opendid获取错误'})
          else
            if @guest = @user.guests.find_by(openid: openid_message["openid"])
              guest_id = @guest.id
            else
              @guest = @user.guests.create(openid: openid_message["openid"])
              guest_id = @guest.id
            end
            token = User.generate_token(32)
            print "print token"
            print "token值: #{token}"
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

        desc 'get access_token'
        get '/access_token/achieve' do
          validate_appkey
          uri = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{@user.app_id}&secret=#{@user.app_secret}"
          response = Net::HTTP.get(URI(uri))
          name = ActiveSupport::JSON.decode(response)
        end
      end
    end
  end
end
