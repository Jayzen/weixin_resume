module API
  module V1
    module Common
      class TapCarousel < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find carousels'
        get '/tap_carousels' do
          validate_appkey
          @carousels = @user.tap_carousels
          carousels = present @carousels, with: API::Entities::TapCarousel
          build_response code: 0, data: carousels
        end 
      end
    end
  end
end
