module API
  module V1
    class Wedding < Grape::API
      include Default
      include Grape::Rails::Cache

      desc 'find carousels'
      get '/carousels' do
        validate_appkey
        @carousels = @user.carousels
        carousels = present @carousels, with: API::Entities::Carousel
        build_response code: 0, data: carousels
      end

      desc 'find one carousels'
      get '/first_carousel' do
        validate_appkey
        @carousel = @user.carousels.first
        carousel = present @carousel, with: API::Entities::Carousel
        build_response code: 0, data: carousel
      end

      desc 'find photographs'
      get '/photographs' do
        validate_appkey
        @photographs = @user.photographs
        photographs = present @photographs, with: API::Entities::Photograph
        build_response code: 0, data: photographs
      end

      desc 'find one photograph'
      get 'photographs/:id' do
        validate_appkey
        @photograph = @user.photographs.find(params[:id])
        photograph = present @photograph, with: API::Entities::Photograph
        build_response code: 0, data: photograph
      end

      desc 'create consult'
      post '/consult' do
        validate_appkey
        @consult = @user.consults.create(name: params[:name], contact: params[:contact])
        if @consult.errors.messages.size != 0
          error!({code: 102, error:  @consult.errors.messages.values.flatten.first})
        end
      end

      desc 'create appointment'
      post '/appointment' do
        validate_appkey
        @appointment = @user.appointments.create(name: params[:name], contact: params[:contact], date: params[:date], time: params[:time])
        if @appointment.errors.messages.size != 0
          error!({code: 102, error:  @appointment.errors.messages.values.flatten.first})
        end
      end
    end
  end
end
