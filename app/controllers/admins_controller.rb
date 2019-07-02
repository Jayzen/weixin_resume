class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:delete, :destroy, :show, :privileges, :update_privilege]
  access root_admin: :all, message: "当前用户无权访问"

  def index
    @users = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email], 
                     name: params[:user][:name], 
                     password: params[:user][:password], 
                     password_confirmation: params[:user][:password_confirmation],
                     style: params[:user][:style]
                    )
    if @user.save
      flash[:success] = "创建成功"
      redirect_to admins_path
    else
      render :new
    end
  end

  def show
  end
  
  def delete
  end

  def search
    term = params[:name].strip
    @users = User.where('name LIKE ?', "%#{term}%").page(params[:page])
    render 'index'
  end

  def destroy
    @user.destroy
    flash[:success] = "用户删除成功"
    redirect_to admins_path
  end

  def privileges
  end

  def update_privilege
    #common
    location = params[:privilege][:location] ? :location :nil
    basic = params[:privilege][:basic] ? :basic : nil
    wedding_basic = params[:privilege][:wedding_basic] ? :wedding_basic : nil
    workshop_basic = params[:privilege][:workshop_basic] ? :workshop_basic : nil
    top = params[:privilege][:top] ? :top : nil
    consult = params[:privilege][:consult] ? :consult : nil
    appointment = params[:privilege][:appointment] ? :appointment : nil
    comment = params[:privilege][:comment] ? :comment : nil
    
    #wedding one
    photograph = params[:privilege][:photograph] ? :photograph : nil
    carousel = params[:privilege][:carousel] ? :carousel : nil
    recent = params[:privilege][:recent] ? :recent : nil
    home_photograph_category = params[:privilege][:home_photograph_category] ? :home_photograph_category : nil
    
    #wedding two
    contact = params[:privilege][:contact] ? :contact : nil
    home_photograph = params[:privilege][:home_photograph] ? :home_photograph : nil
    movie = params[:privilege][:movie] ? :movie : nil
    menu = params[:privilege][:menu] ? :menu : nil
    tap_carousel = params[:privilege][:tap_carousel] ? :tap_carousel : nil
    tap_sort = params[:privilege][:tap_sort] ? :tap_sort : nil
    tap_photograph = params[:privilege][:tap_photograph] ? :tap_photograph : nil
    state = params[:privilege][:state] ? :state : nil
    official_account = params[:privilege][:official_account] ? :official_account : nil

    #mall
    affair = params[:privilege][:affair] ? :affair : nil
    independent_carousel = params[:privilege][:independent_carousel] ? :independent_carousel : nil
    product = params[:privilege][:product] ? :product : nil
    merchant_image = params[:privilege][:merchant_image] ? :merchant_image : nil
    merchant_basic = params[:privilege][:merchant_basic] ? :merchant_basic : nil
    hot_word = params[:privilege][:hot_word] ? :hot_word : nil

    @user.roles = [location, basic, wedding_basic, workshop_basic, top, consult, appointment, comment, recent, home_photograph_category,
                   carousel, photograph,
                   contact, home_photograph, tap_sort, tap_photograph, movie, menu, tap_carousel, state, official_account,
                   affair, independent_carousel, product, merchant_image, merchant_basic, hot_word
                  ].compact
    @user.save

    flash[:success] = "权限更新成功"
    redirect_to privileges_admin_path(@user)
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
