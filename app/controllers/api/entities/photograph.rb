module API
  module Entities
    class Photograph < Grape::Entity
      expose :id
      expose :name
      expose :small_pic
      expose :big_pic
      expose :price
      expose :merit
      expose :age
      expose :clothing
      expose :picture
      expose :photographer
      expose :others

      private
        def small_pic
          if Rails.env == "production"
            link = "https://eco-news.cn" + object.small_pic.url.to_s
          else
            link = "http://localhost:3000" + object.small_pic.url.to_s
          end
        end
        
        def big_pic
          if Rails.env == "production"
            link = "https://eco-news.cn" + object.big_pic.url.to_s
          else
            link = "http://localhost:3000" + object.big_pic.url.to_s
          end
        end
    end
  end
end
