module API
  module V1
    module Common
      class Basic < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find basic'
        get '/basic' do
          validate_appkey
          @basic = @user.basic
          @basic.visit = @basic.visit+1
          @basic.save
          basic = present @basic, with: API::Entities::Basic
          build_response code: 0, data: basic
        end

        desc 'find affair basic'
        get '/affair_basic' do
          validate_appkey
          @basic = @user.merchant_basic
          basic = present @basic, with: API::Entities::AffairBasic
        end
      end
    end
  end
end
