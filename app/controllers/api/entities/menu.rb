module API
  module Entities
    class Menu < Grape::Entity
      expose :id
      expose :title
      expose :content
      expose :pic
      expose :price

      private
        def pic
          if Rails.env == "production"
            link = "https://eco-news.cn" + object.pic.url.to_s
          else
            link = "http://localhost:3000" + object.pic.url.to_s
          end
        end
    end
  end
end
