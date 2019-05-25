module API
  module V1
    module Common
      class Location < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find location'
        get '/location' do
          validate_appkey
          @location = @user.location
          location = present @location, with: API::Entities::Location
          build_response code: 0, data: location
        end
      end
    end
  end
end
