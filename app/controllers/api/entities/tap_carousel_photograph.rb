module API
  module Entities
    class TapCarouselPhotograph < Grape::Entity
      expose :id
      expose :name
      expose :home_pic
      expose :category_pic

      private
        def home_pic
          if Rails.env == "production"
            link = "https://eco-news.cn" + object.home_pic.url.to_s
          else
            link = "http://localhost:3000" + object.home_pic.url.to_s
          end
        end 

        def category_pic
          if Rails.env == "production"
            link = "https://eco-news.cn" + object.category_pic.url.to_s
          else
            link = "http://localhost:3000" + object.category_pic.url.to_s
          end
        end
    end
  end
end
