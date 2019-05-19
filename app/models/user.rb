class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:root_admin, :editor], multiple: true)                                      ##
  ############################################################################################ 
 

  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable, :lockable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

  has_one :basic
  has_one :location
  has_many :comments

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
    self.create_basic(name: "name", motto: "motto", introduction: "introduction", phone: "phone", avatar: "phone", wechat: "wechat", qq: "qq", email: "email", company: "company", job: "job", address: "address")
  end

  def create_default_location
    self.create_location(name: "浙江大学", address: "杭州市西湖区浙大路38号", latitude: 30.263964, longitude: 120.123218)
  end
end
