module API
  module V1
    module Common
      class Basic < Grape::API
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
      end
    end
  end
end
