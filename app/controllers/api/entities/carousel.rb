module API
  module Entities
    class Carousel < Grape::Entity
      expose :name
      expose :pic

      private
        def pic
          if Rails.env == "production"
            link = "https://zhengjiajun.com" + object.pic.url.to_s
          else
            link = "http://localhost:3000" + object.pic.url.to_s
          end
        end 
    end
  end
end
