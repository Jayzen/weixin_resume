module API
  module V1
    module Common
      class Recent < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find carousels'
        get '/recents' do
          validate_appkey
          @recents = @user.recents.includes(:photograph).where(reveal: true).order(order: :asc)
          recents = present @recents, with: API::Entities::Recent
          build_response code: 0, data: recents
        end 
      end
    end
  end
end
