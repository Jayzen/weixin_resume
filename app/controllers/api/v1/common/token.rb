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
      end
    end
  end
end
