module API
  module Entities
    class Basic < Grape::Entity
      expose :name
      expose :motto
      expose :introduce
      expose :phone
      expose :wechat
      expose :email
      expose :company
      expose :job
      expose :position
      expose :avatar
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
