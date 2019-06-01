class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:root_admin, :movie, :basic, :wedding_basic, :workshop_basic,:location, :comment, :carousel, :photograph, :consult, :appointment], multiple: true)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable, :validatable, :registerable, :lockable, :recoverable
  devise :database_authenticatable, :registerable, :trackable, :rememberable, :timeoutable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: { message: "名字不能为空" }
  validates :email, presence: { message: "邮箱不能为空" }
  validates :email, format: { with: VALID_EMAIL_REGEX, message: "邮件格式不正确" }, unless: proc{ |user| user.email.blank? }
  validates :password, presence: { message: "密码不能为空" }, allow_nil: true
  validates :password, length: { minimum: 6, message: "密码不能少于6个字符" }, unless: proc{ |user| user.password.blank? }
  validates :password_confirmation, presence: { message: "密码确认不能为空" }, allow_nil: true
  validates :password_confirmation, length: { minimum: 6, message: "密码确认不能少于6个字符" }, unless: proc{ |user| user.password_confirmation.blank? }
  validates :password, confirmation: { message: "两次密码不一致"}, unless: proc{ |user| user.password.blank? && user.password_confirmation.blank? }

  has_one :basic
  has_one :wedding_basic
  has_one :workshop_basic
  has_one :location
  has_many :comments
  has_many :carousels
  has_many :photographs
  has_many :consults
  has_many :appointments
  has_many :movies
  has_many :menus

  after_create :set_role, :generate_token, :create_default_basic, :create_default_location

  def set_role
    self.roles = 'editor'
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
end
