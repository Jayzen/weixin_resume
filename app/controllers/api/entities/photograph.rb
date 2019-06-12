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
            link = Rails.application.credentials.pr_base_url + object.small_pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.small_pic.url.to_s
          end
        end
        
        def big_pic
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.big_pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.big_pic.url.to_s
          end
        end
    end
  end
end
