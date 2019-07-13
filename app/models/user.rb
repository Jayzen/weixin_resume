class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:root_admin, 
                    :affair, :location, :basic, :wedding_basic, :workshop_basic, :top, :consult, :appointment, :comment, :recent, :home_photograph_category,
                    :carousel, :photograph,
                    :contact, :home_photograph, :tap_photograph, :tap_carousel, :official_account, :movie, :menu, :state,
                    :independent_carousel, :affair, :product, :merchant_image, :merchant_basic, :hot_word, :product_home,
                    :banner, :theme, :guest
                    ], multiple: true)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable, :validatable, :registerable, :lockable, :recoverable
  devise :database_authenticatable, :registerable, :trackable, :rememberable, :timeoutable
  
  mount_uploader :merchant, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: { message: "名字不能为空" }
  validates :email, presence: { message: "邮箱不能为空" }
  validates :style, presence: { message: "样式不能为空" }, allow_nil:true
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "邮件格式不正确" }, unless: proc{ |user| user.email.blank? }
  validates :password, presence: { message: "密码不能为空" }, allow_nil: true
  validates :password, length: { minimum: 6, message: "密码不能少于6个字符" }, unless: proc{ |user| user.password.blank? }
  validates :password_confirmation, presence: { message: "密码确认不能为空" }, allow_nil: true
  validates :password_confirmation, length: { minimum: 6, message: "密码确认不能少于6个字符" }, unless: proc{ |user| user.password_confirmation.blank? }
  validates :password, confirmation: { message: "两次密码不一致"}, unless: proc{ |user| user.password.blank? && user.password_confirmation.blank? }

  has_one :basic, dependent: :destroy
  has_one :wedding_basic, dependent: :destroy
  has_one :workshop_basic, dependent: :destroy
  has_one :location, dependent: :destroy
  has_one :merchant_basic, dependent: :destroy


  has_many :recents, dependent: :destroy
  has_many :home_photograph_categories, dependent: :destroy
  has_many :tap_photographs, dependent: :destroy
  has_many :tap_photograph_images, dependent: :destroy
  has_many :home_photographs, dependent: :destroy

  has_many :merchant_basic_images, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :product_images, dependent: :destroy
  has_many :product_details, dependent: :destroy
  has_many :affair_images, dependent: :destroy
  has_many :merchant_images, dependent: :destroy
  has_many :official_accounts, dependent: :destroy
  has_many :affairs, dependent: :destroy
  has_many :sorts, dependent: :destroy
  has_many :hot_words, dependent: :destroy

  has_many :banners, dependent: :destroy
  has_many :themes, dependent: :destroy
  has_many :product_themes, dependent: :destroy
  has_many :product_homes, dependent: :destroy 
  has_many :product_sorts, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  
  has_many :user_guests, dependent: :destroy
  has_many :guests, through: :user_guests

  has_many :comments, dependent: :destroy
  has_many :carousels, dependent: :destroy
  has_many :tap_carousels, dependent: :destroy
  has_many :independent_carousels, dependent: :destroy
  has_many :photographs, dependent: :destroy
  has_many :consults, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :menu_details, dependent: :destroy
  has_many :tops, dependent: :destroy
  has_many :states, dependent: :destroy

  after_create :set_style, :generate_token, :create_default_basic, :create_default_location, :create_default_merchant_basic

  def set_style
    case self.style
    when "resume"
      self.roles = [:basic, :location, :comment]
    when "wedding_one"
      self.roles = [:affair, :wedding_basic, :location, :carousel, :photograph, :consult, :top, :appointment, :recent, :home_photograph_category]
    when "wedding_two"
      self.roles = [:contact, :home_photograph, :state, :official_account, :wedding_basic, :location, :tap_carousel,  :tap_photograph, :menu, :movie, :top]
    when "workshop"
      self.roles = [:workshop_basic, :location, :carousel]
    when "mall"
      self.roles = [:merchant_basic, :location, :independent_carousel, :affair, :product, :merchant_image, :hot_word, :client]
    when "mall_v2"
      self.roles = [:product, :product_home, :banner, :theme, :guest]
    else 
      self.roles = "editor"
    end
    self.save
  end

  def generate_token
    a = lambda { rand(36).to_s(36) }
    token = ""
    10.times { |t| token << a.call.to_s }
    token
    self.appkey = token
    self.save
  end

  def create_default_basic
    self.create_basic(name: "jayzen", avatar: "uploads/basic/avatar/1/user.png", motto: "生如夏花", introduction: "自我介绍", phone: "18888888888", wechat: "wechat", qq: "645112211", email: "jayzen@foxmail.com", company: "company", job: "job", address: "address")
    self.create_wedding_basic(name: "jayzen", phone: "18868818399", avatar: "uploads/basic/avatar/1/user.png")
    self.create_workshop_basic(name: "jayzen", phone: "18868818399", business_hour: "18")
  end

  def create_default_location
    self.create_location(name: "浙江大学", address: "杭州市西湖区浙大路38号", latitude: 30.263964, longitude: 120.123218)
  end

  def create_default_merchant_basic
    self.create_merchant_basic(duty: "8:00-22:00", name: "jayzen", phone: "18868818399")
  end

  def get_openid(code)
    uri = "https://api.weixin.qq.com/sns/jscode2session?appid=#{self.app_id}&secret=#{self.app_secret}&js_code=#{code}&grant_type=authorization_code"
    response = Net::HTTP.get(URI(uri))
    ActiveSupport::JSON.decode(response)
  end

  def get_access_token
    uri = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{self.app_id}&secret=#{self.app_secret}"
    response = Net::HTTP.get(URI(uri))
    name = ActiveSupport::JSON.decode(response)
  end

  def send_consult_template(form_id, name, contact, content)
    access_token = self.get_access_token["access_token"]
    template_id = "iZfL6-huU3tjrPv3gM79a3OVvBUp8ON3qpC4TwryJ4s"
    page = "pages/merchant-consult/index"
    emphasis_hot_word = ""
    data = {"hot_word1":{"value": name}, "hot_word2":{"value": contact}, "hot_word3":{"value": content}}
    uri = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/uniform_send?access_token=#{access_token}"
    content = {
      "touser": self.openid,
      "weapp_template_msg":{
        "template_id": template_id,
        "page": page,
        "form_id": form_id,
        "data": data,
        "emphasis_hot_word": emphasis_hot_word
      } 
    } 

    Net::HTTP.post(URI(uri), content.to_json, "Content-Type": "application/json")
  end

  def send_appointment_template(form_id, name, contact, date, time)
    access_token = self.get_access_token["access_token"]
    template_id = "CzcXQjGXXqqxxwmUzCqSdvceFI_8MYmMluLP-KnO_LI"
    page = "pages/merchant-appointment/index"
    emphasis_hot_word = ""
    date_time = date + " " + time
    data = {"hot_word1":{"value": name}, "hot_word2":{"value": contact}, "hot_word3":{"value": date_time}}
    uri = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/uniform_send?access_token=#{access_token}"
    content = {
      "touser": self.openid,
      "weapp_template_msg":{
        "template_id": template_id,
        "page": page,
        "form_id": form_id,
        "data": data,
        "emphasis_hot_word": emphasis_hot_word
      }
    }

    Net::HTTP.post(URI(uri), content.to_json, "Content-Type": "application/json")
  end

  def send_contact_template(form_id, name, telephone)
    access_token = self.get_access_token["access_token"]
    template_id = "iZfL6-huU3tjrPv3gM79a5LT-5OdvD1CKQuKCreOhNI"
    page = "pages/merchant-contact/index"
    emphasis_hot_word = ""
    data = {"hot_word1":{"value": name}, "hot_word2":{"value": telephone}}
    uri = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/uniform_send?access_token=#{access_token}"
    content = {
      "touser": self.openid,
      "weapp_template_msg":{
        "template_id": template_id,
        "page": page,
        "form_id": form_id,
        "data": data,
        "emphasis_hot_word": emphasis_hot_word
      }
    }

    Net::HTTP.post(URI(uri), content.to_json, "Content-Type": "application/json")
  end

  def self.generate_token len = 8
    a = lambda { rand(36).to_s(36) }
    token = ""
    len.times { |t| token << a.call.to_s }
    token
  end
 
  def self.generate_order_uuid
    Date.today.to_s.split('-').join()[2..-1] << generate_token(8).upcase
  end
end
