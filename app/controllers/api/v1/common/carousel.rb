module API
  module V1
    module Common
      class Carousel < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find carousels'
        get '/carousels' do
          validate_appkey
          @carousels = @user.carousels
          carousels = present @carousels, with: API::Entities::Carousel
          build_response code: 0, data: carousels
        end 
      end
    end
  end
end
