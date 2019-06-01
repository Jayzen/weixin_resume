module API
  module V1
    module Common
      class Menu < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find menus'
        get '/menus' do
          validate_appkey
          @menus = @user.menus
          menus = present @menus, with: API::Entities::Menu
          build_response code: 0, data: menus
        end
      end
    end
  end
end
