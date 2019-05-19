class BasicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_basic, only: [:show, :edit, :update]
  before_action :set_attributes, only: [:show, :edit]

  def show
    
  end

  def edit
  end

  def update
    if @basic.update(basic_params)
      flash[:success] = "更新成功"
      redirect_to basic_path
    else
      render :edit
    end
  end

  private
    def set_basic
      @basic = current_user.basic
    end

    def basic_params
      params.require(:basic).permit(:name, :motto, :introduction, :phone, :avatar, :wechat, :qq, :email, :company, :job, :address,
                                   :is_name, :is_motto, :is_introduction, :is_phone, :is_avatar, :is_wechat, :is_qq, :is_email, :is_company, :is_job, :is_address
                                   )
    end

    def set_attributes
      @attributes = @basic.attributes.keys.select{|value| (value == "avatar")|| (value == "name")||(value == "motto")||(value == "introduction") || (value=="phone") || (value == "wechat")||(value == "qq") || (value == "email") || (value == "company") || (value == "job") || (value == "address")}
    end
end
