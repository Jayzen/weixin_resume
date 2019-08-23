module API
  module V1
    module Common
      class Guest < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'update guest'
        post '/guest/update' do
          validate_appkey
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @user.guests.find(guest_id).update(nickname: params[:nickname], avatar: params[:avatar], gender: params[:gender])
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'find specific guest'
        get '/guest' do
          validate_appkey
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @guest = @user.guests.find(guest_id)
            guest = present @guest, with: API::Entities::Guest
          else
            error!({code: 102, error: "不存在token"})
          end
        end
      end
    end
  end
end
