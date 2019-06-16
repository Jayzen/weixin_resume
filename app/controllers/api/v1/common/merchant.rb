module API
  module V1
    module Common
      class Merchant < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'merchant verify'
        params do
          requires :code, type: String
        end
        post '/merchant/verify' do
          validate_appkey
          openid_message = @user.get_openid(params[:code])
          @user.openid = openid_message["openid"]
          @user.save
        end
      end
    end
  end
end
