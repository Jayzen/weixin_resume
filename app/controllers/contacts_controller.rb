class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:destroy, :delete]
  #access contact: :all, message: "当前用户无权访问"

  def index
    @contacts = current_user.contacts.page(params[:page])
  end

  def delete
  end

  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: '删除成功'
  end

  private
    def set_contact
      @contact = current_user.contacts.find(params[:id])
    end
end
