module API
  module Entities
    class MerchantBasic < Grape::Entity
      expose :duty
      expose :is_wifi
      expose :is_parking
      expose :is_wechat_pay
      expose :is_alipay
      expose :avatar
      expose :name
      expose :phone
      expose :description

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
