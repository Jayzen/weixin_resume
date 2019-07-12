module API
  module V1
    module Common
      class Address < Grape::API
        include Default
        include Grape::Rails::Cache

        before do
          validate_appkey
        end  
       
        desc 'post guest address'
        params do
          requires :name, type: String
          requires :mobile, type: String
          requires :province, type: String
          requires :city, type: String
          requires :country, type: String
          requires :detail, type: String
        end
        post '/address' do
          cache = cache_value
          guest_id = cache["guest_id"]
          if @guest = @user.guests.find(guest_id)
            create_or_update_guest_address(@guest)
          else
            error!({code: 1, message: '数据库中不存在该用户'})
          end
        end

        desc 'get guest address'
        get 'guest/address' do
          cache = cache_value
          guest_id = cache["guest_id"]
          if guest = @user.guests.find(guest_id)
            guest_address = guest.guest_address
            guest_address = present guest_address, with: API::Entities::Address
          else
            error!({code: 1, message: '用户不存在'})
          end
        end
      end
    end
  end
end
