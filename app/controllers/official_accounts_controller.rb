class OfficialAccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_official_account, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_official_accounts, only: [:index]
  #access official_account: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @official_account = current_user.official_accounts.new
  end

  def edit
  end

  def create
    @official_account = current_user.official_accounts.new(official_account_params)

    if @official_account.save
      flash[:success] = "创建成功"
      redirect_to official_accounts_path
    else
      render :new
    end
  end
  
  def update
    if @official_account.update(official_account_params)
      flash[:success] = "更新成功"
      redirect_to official_accounts_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @official_account.destroy
    flash[:success] = "删除成功"
    redirect_to official_accounts_path
  end

  private
    def set_official_account
      @official_account = current_user.official_accounts.find(params[:id])
    end

    def official_account_params
      params.require(:official_account).permit(:name, :pic, :reveal, :order)
    end
    
    def set_official_accounts
      @official_accounts = current_user.official_accounts.order(order: :desc).page(params[:page])
    end
end
