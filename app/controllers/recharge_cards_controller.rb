class RechargeCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recharge_card, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_recharge_cards, only: [:index]
  access recharge_card: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @recharge_card = current_user.recharge_cards.new
  end

  def edit
  end

  def create
    @recharge_card = current_user.recharge_cards.new(recharge_card_params)

    if @recharge_card.save
      flash[:success] = "创建成功"
      redirect_to recharge_cards_path
    else
      render :new
    end
  end
  
  def update
    if @recharge_card.update(recharge_card_params)
      flash[:success] = "更新成功"
      redirect_to recharge_cards_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @recharge_card.destroy
    flash[:success] = "删除成功"
    redirect_to recharge_cards_path
  end

  private
    def set_recharge_card
      @recharge_card = current_user.recharge_cards.find(params[:id])
    end

    def recharge_card_params
      params.require(:recharge_card).permit(:name, :recharge, :benefit, :order, :reveal)
    end

    def set_recharge_cards
      @recharge_cards = current_user.recharge_cards.page(params[:page])
    end
end
