class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:root_admin, 
                    :location, :basic, :wedding_basic, :workshop_basic, :top, :consult, :appointment, :comment,
                    :carousel, :photograph,
                    :movie, :menu, :tap_carousel, :tap_carousel_photograph, :state
                    ], multiple: true)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable, :validatable, :registerable, :lockable, :recoverable
  devise :database_authenticatable, :registerable, :trackable, :rememberable, :timeoutable
  
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
  has_many :comments, dependent: :destroy
  has_many :carousels, dependent: :destroy
  has_many :tap_carousels, dependent: :destroy
  has_many :tap_carousel_photographs, dependent: :destroy
  has_many :tap_carousel_details, dependent: :destroy
  has_many :photographs, dependent: :destroy
  has_many :consults, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :menu_details, dependent: :destroy
  has_many :tops, dependent: :destroy
  has_many :states, dependent: :destroy

  after_create :set_style, :generate_token, :create_default_basic, :create_default_location

  def set_style
    case self.style
    when "resume"
      self.roles = [:basic, :location, :comment]
    when "wedding_one"
      self.roles = [:wedding_basic, :location, :carousel, :photograph, :consult, :top, :appointment]
    when "wedding_two"
      self.roles = [:wedding_basic, :location, :tap_carousel, :tap_carousel_photograph, :menu, :movie, :top]
    when "workshop"
      self.roles = [:workshop_basic, :location, :carousel]
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
    self.create_wedding_basic(name: "jayzen", phone: "18868818399")
    self.create_workshop_basic(name: "jayzen", phone: "18868818399", business_hour: "18")
  end

  def create_default_location
    self.create_location(name: "浙江大学", address: "杭州市西湖区浙大路38号", latitude: 30.263964, longitude: 120.123218)
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

  def send_template(form_id, name, contact)
    access_token = self.get_access_token["access_token"]
    touser = "oxaRd5ZMUpZbwQYcvBFi75zVNTFg"
    template_id = "iZfL6-huU3tjrPv3gM79a5LT-5OdvD1CKQuKCreOhNI"
    page = "pages/home/index"
    emphasis_keyword = ""
    data = {"keyword1":{"value": name}, "keyword2":{"value": contact}}
    uri = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/uniform_send?access_token=#{access_token}"
    content = {
      "touser": touser,
      "weapp_template_msg":{
        "template_id": template_id,
        "page": page,
        "form_id": form_id,
        "data": data,
        "emphasis_keyword": emphasis_keyword
      } 
    } 

    response = Net::HTTP.post(URI(uri), content.to_json, "Content-Type": "application/json")
    logger.info response
  end
end
