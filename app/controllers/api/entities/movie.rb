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
            link = Rails.application.credentials.pr_base_url + object.movie.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.movie.url.to_s
          end
        end
    end
  end
end
