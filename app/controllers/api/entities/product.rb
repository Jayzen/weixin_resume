module API
  module Entities
    class Product < Grape::Entity
      expose :id
      expose :name
      expose :description
      expose :pic
      expose :current_price
      expose :old_price
      expose :stock
      expose :view

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
