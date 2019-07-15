module API
  module Entities
    class Order < Grape::Entity
      expose :order_no
      expose :total_price
      expose :total_count
      expose :status
      expose :snap_img
      expose :snap_name
      expose :snap_items
      expose :snap_address
    
      private
        def snap_img
          if Rails.env == "production"
            link = Rails.application.credentials.pr_base_url + object.snap_img.url.to_s
          else
            link = Rails.application.credentials.de_base_url + object.snap_img.url.to_s
          end
        end
    end
  end
end
