class WeddingBasicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wedding_basic, only: [:show, :edit, :update]
  access wedding_basic: :all, message: "当前用户无权访问"

  def show
  end

  def edit
  end

  def update
    if @wedding_basic.update(wedding_basic_params)
      flash[:success] = "更新成功"
      redirect_to edit_wedding_basic_path
    else
      render :edit
    end
  end

  private
    def set_wedding_basic
      @wedding_basic = current_user.wedding_basic
    end

    def wedding_basic_params
      params.require(:wedding_basic).permit(:name, :phone)
    end
end
