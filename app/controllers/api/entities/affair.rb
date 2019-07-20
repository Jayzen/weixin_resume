module API
  module Entities
    class Affair < Grape::Entity
      expose :id
      expose :content
      expose :updated_at
      expose :affair_comments_count
      expose :affair_likes_count
      expose :affair_shares_count
      expose :affair_images, using: API::Entities::AffairImage
      expose :affair_comments, using: API::Entities::AffairComment
      expose :affair_likes, using: API::Entities::AffairLike
      expose :product, using: API::Entities::ProductAffair
    
      private
        def updated_at
          updated_at = object.updated_at.strftime("%F %H:%M")
        end 
    end
  end
end
