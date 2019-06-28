module API
  module Entities
    class Affair < Grape::Entity
      expose :id
      expose :name
      expose :updated_at
      #expose :like_counts
      #expose :like_guests
      expose :affair_images, using: API::Entities::AffairImage
      expose :affair_comments, using: API::Entities::AffairComment
      expose :product, using: API::Entities::Product

      private
        def updated_at
          updated_at = object.updated_at.strftime("%F %H:%M")
        end

        def like_counts
          like_counts = object.guests.size
        end

        def like_guests
          like_counts = object.guests.pluck(:id)
        end
    end
  end
end
