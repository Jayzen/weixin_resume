class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update]
  access location: :all, message: "当前用户无权访问"

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      flash[:success] = "更新成功"
      redirect_to location_path
    else
      render :edit
    end
  end

  private
    def set_location
      @location = current_user.location
    end

    def location_params
      params.require(:location).permit(:name, :address, :latitude, :longitude)
    end
end
