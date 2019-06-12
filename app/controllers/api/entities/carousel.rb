module API
  module Entities
    class Carousel < Grape::Entity
      expose :name
      expose :pic

      private
        def pic
          debugger
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.pic.url.to_s
          end
        end 
    end
  end
end
