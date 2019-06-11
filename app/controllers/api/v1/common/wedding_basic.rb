module API
  module V1
    module Common
      class WeddingBasic < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find wedding basic'
        get '/wedding_basic' do
          validate_appkey
          @wedding_basic = @user.wedding_basic
          wedding_basic = present @wedding_basic, with: API::Entities::WeddingBasic
          build_response code: 0, data: wedding_basic
        end 
      end
    end
  end
end
