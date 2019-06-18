module API
  module Entities
    class Carousel < Grape::Entity
      expose :name
      expose :pic
      expose :photograph, using: API::Entities::Photograph

      private
        def pic
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.pic.url.to_s
          end
        end 
    end
  end
end
