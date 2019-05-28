module API
  module V1
    class Wedding < Grape::API
      include Default
      include Grape::Rails::Cache

      before do
        validate_appkey
      end

      desc 'find basic'
      get '/wedding_basic' do
        @wedding_basic = @user.wedding_basic
        wedding_basic = present @wedding_basic, with: API::Entities::WeddingBasic
        build_response code: 0, data: wedding_basic
      end

      desc 'find carousels'
      get '/carousels' do
        @carousels = @user.carousels
        carousels = present @carousels, with: API::Entities::Carousel
        build_response code: 0, data: carousels
      end

      desc 'find one carousels'
      get '/first_carousel' do
        @carousel = @user.carousels.first
        carousel = present @carousel, with: API::Entities::Carousel
        build_response code: 0, data: carousel
      end

      desc 'find photographs'
      get '/photographs' do
        @photographs = @user.photographs
        photographs = present @photographs, with: API::Entities::Photograph
        build_response code: 0, data: photographs
      end

      desc 'find one photograph'
      get 'photographs/:id' do
        @photograph = @user.photographs.find(params[:id])
        photograph = present @photograph, with: API::Entities::Photograph
        build_response code: 0, data: photograph
      end

      desc 'create consult'
      post '/consult' do
        @consult = @user.consults.create(name: params[:name], contact: params[:contact])
        if @consult.errors.messages.size != 0
          error!({code: 102, error:  @consult.errors.messages.values.flatten.first})
        end
      end

      desc 'create appointment'
      post '/appointment' do
        @appointment = @user.appointments.create(name: params[:name], contact: params[:contact], date: params[:date], time: params[:time])
        if @appointment.errors.messages.size != 0
          error!({code: 102, error:  @appointment.errors.messages.values.flatten.first})
        end
      end
    end
  end
end
