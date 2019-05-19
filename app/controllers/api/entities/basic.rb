module API
  module Entities
    class Basic < Grape::Entity
      expose :name
      expose :is_name
      expose :motto
      expose :is_motto
      expose :introduction
      expose :is_introduction
      expose :phone
      expose :is_phone
      expose :wechat
      expose :is_wechat
      expose :email
      expose :is_email
      expose :company
      expose :is_company
      expose :job
      expose :is_job
      expose :address
      expose :is_address
      expose :avatar
      expose :is_avatar
      expose :visit

      private
        def avatar
          if Rails.env == "production"
            link = "https://zhengjiajun.com" + object.avatar.url.to_s
          else
            link = "http://localhost:3000" + object.avatar.url.to_s
          end
        end 
    end
  end
end
