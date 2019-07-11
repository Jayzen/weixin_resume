module API
  module Entities
    class Theme < Grape::Entity
      expose :id
      expose :name
      expose :home_pic
      expose :theme_pic

      private
        def home_pic
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.home_pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.home_pic.url.to_s
          end
        end

        def theme_pic
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.theme_pic.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.theme_pic.url.to_s
          end
        end
    end
  end
end
