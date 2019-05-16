require 'net/http'

class Guest < ApplicationRecord
  has_many :comments, dependent: :destroy

  def self.get_openid(code)
    uri = "https://api.weixin.qq.com/sns/jscode2session?appid=#{Rails.application.credentials.weixin_appid}&secret=#{Rails.application.credentials.weixin_secret}&js_code=#{code}&grant_type=authorization_code"
    response = Net::HTTP.get(URI(uri))
    ActiveSupport::JSON.decode(response)
  end

  def self.generate_token len = 8
    a = lambda { rand(36).to_s(36) }
    token = ""
    len.times { |t| token << a.call.to_s }
    token
  end 
end
