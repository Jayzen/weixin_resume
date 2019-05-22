class ConsultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_consult, only: [:destroy, :delete]

  def index
    @consults = current_user.consults.page(params[:page])
  end

  def delete
  end

  def destroy
    @consult.destroy
    redirect_to consults_url, notice: '删除成功'
  end

  private
    def set_consult
      @consult = current_user.consults.find(params[:id])
    end
end
