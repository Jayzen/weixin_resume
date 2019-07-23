module API
  module V1
    module Common
      class QrCode < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'create qr_code'
        params do
          #optional :remark, type: String
        end 
        post '/create_qr_code' do
          validate_appkey
          access_token = @user.get_access_token["access_token"]
          uri = "https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token=#{access_token}"
          content = {
            "scene" => "id=1",
            "page" => "pages/home/index"
          }
          #Net::HTTP.post URI(uri), content.to_json, "accept-encoding" => "none"
          #Net::HTTP.post URI(uri), content.to_json, header = nil
          response = Net::HTTP.post(URI(uri), content.to_json, "accept-encoding" => "gzip")
        end
      end
    end
  end
end
