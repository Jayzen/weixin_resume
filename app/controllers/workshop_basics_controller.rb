class WorkshopBasicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workshop_basic, only: [:show, :edit, :update]
  access workshop_basic: :all, message: "当前用户无权访问"

  def show
  end

  def edit
  end

  def update
    if @workshop_basic.update(workshop_basic_params)
      flash[:success] = "更新成功"
      redirect_to edit_workshop_basic_path
    else
      render :edit
    end
  end

  private
    def set_workshop_basic
      @workshop_basic = current_user.workshop_basic
    end

    def workshop_basic_params
      params.require(:workshop_basic).permit(:name, :phone, :business_hour)
    end
end
