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
            link = Rails.application.credentials.pr_base_url + object.home_pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.home_pic.url.to_s
          end
        end 

        def category_pic
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.category_pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.category_pic.url.to_s
          end
        end
    end
  end
end
