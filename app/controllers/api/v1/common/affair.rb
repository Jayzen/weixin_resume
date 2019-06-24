module API
  module V1
    module Common
      class Affair < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find location'
        params do 
          optional :token, type: String
        end
        post '/affairs' do
          validate_appkey
          @affairs = @user.affairs.includes(:affair_images, [affair_comments: :guest], :guests).where(reveal: true).order(order: :desc)
          affairs = present @affairs, with: API::Entities::Affair
          build_response code: 0, data: affairs
        end
      end
    end
  end
end
