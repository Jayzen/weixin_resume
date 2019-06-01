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

        desc 'find menu details'
        get '/menus/:id' do
          validate_appkey
          @menu = @user.menus.find(params[:id])
          @menu_details = @menu.menu_details
          menu_details = present @menu_details, with: API::Entities::MenuDetail
          build_response code: 0, data: menu_details
        end
      end
    end
  end
end
