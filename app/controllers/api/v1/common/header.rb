module API
  module V1
    module Common
      class Header < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find header'
        get '/header' do
          validate_appkey
          @header = @user.headers.find(1)
          header = present @header, with: API::Entities::Header
          build_response code: 0, data: header
        end 
      end
    end
  end
end
