class ClientsController < ApplicationController
  before_action :set_client, only: [:destroy, :delete]
  access root_admin: :all, message: "当前用户无权访问"

  def index
    @clients = Client.page(params[:page])
  end

  def delete
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: '删除成功'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end
end
