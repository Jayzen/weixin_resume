module API
  module Entities
    class Movie < Grape::Entity
      expose :id
      expose :title
      expose :content
      expose :movie

      private
        def movie
          if Rails.env == "production"
            link = "https://eco-news.cn" + object.movie.url.to_s
          else
            link = "http://localhost:3000" + object.movie.url.to_s
          end
        end
    end
  end
end
