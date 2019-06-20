module API
  module Entities
    class Affair < Grape::Entity
      expose :id
      expose :name
      expose :updated_at
      expose :affair_images, using: API::Entities::AffairImage
      expose :affair_comments, using: API::Entities::AffairComment

      private
        def updated_at
          updated_at = object.updated_at.strftime("%F %H:%M")
        end

        def affair_images
          affair_images = object.affair_images.where(reveal: true).order(order: :desc)
        end

        def affair_comments
          affair_comments = object.affair_comments.where(reveal: true).order(created_at: :desc)
        end
    end
  end
end
