module API
  module Entities
    class Photograph < Grape::Entity
      expose :id
      expose :name
      expose :pic
      expose :price
      expose :merit
      expose :age
      expose :clothing
      expose :picture
      expose :photographer
      expose :others

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
