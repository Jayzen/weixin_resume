module API
  module V1
    module Common
      class Guest < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'update guest'
        params do
          requires :token, type: String
        end
        post '/guest/update' do
          if token = Redis.new.get(params[:token])
            guest_id = JSON.parse(token)["guest_id"]
            ::Guest.find(guest_id).update(nickname: params[:nickname], avatar: params[:avatar], gender: params[:gender])
          end
        end 
      end
    end
  end
end
