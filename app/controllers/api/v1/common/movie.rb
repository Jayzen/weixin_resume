module API
  module V1
    module Common
      class Movie < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find movies'
        get '/movies' do
          validate_appkey
          @movies = @user.movies
          movies = present @movies, with: API::Entities::Movie
          build_response code: 0, data: movies
        end
      end
    end
  end
end
