module API
  module Entities
    class Menu < Grape::Entity
      expose :id
      expose :title
      expose :pic
      expose :price

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
