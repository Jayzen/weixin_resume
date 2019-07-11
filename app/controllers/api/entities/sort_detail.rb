module API
  module Entities
    class SortDetail < Grape::Entity
      expose :id
      expose :name
      expose :pic
      expose :products, using: API::Entities::Product
    
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
