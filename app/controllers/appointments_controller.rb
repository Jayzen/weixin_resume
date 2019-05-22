class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:destroy, :delete]

  def index
    @appointments = current_user.appointments.page(params[:page])
  end

  def delete
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: '删除成功'
  end

  private
    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
    end
end
