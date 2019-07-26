module API
  module V1
    module Common
      class User < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'get mall user'
        get '/mall_user' do
          mall_user
        end
      end
    end
  end
end
