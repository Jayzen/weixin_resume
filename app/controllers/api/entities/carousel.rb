module API
  module Entities
    class Carousel < Grape::Entity
      expose :name
      expose :pic

      private
        def pic
          debugger
          if Rails.env == "production"
            link = "https://eco-new.cn" + object.pic.url.to_s
          else
            link = "http://localhost:3000" + object.pic.url.to_s
          end
        end 
    end
  end
end
