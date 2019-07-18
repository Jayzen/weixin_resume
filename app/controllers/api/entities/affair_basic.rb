module API
  module Entities
    class AffairBasic < Grape::Entity
      expose :name
      expose :avatar

      private
        def avatar
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.avatar.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.avatar.url.to_s
          end
        end 
    end
  end
end
