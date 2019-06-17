module API
  module V1
    class Wedding < Grape::API
      include Default
      include Grape::Rails::Cache

      before do
        validate_appkey
      end

      desc 'find photographs'
      get '/photographs' do
        @photographs = @user.photographs.where(reveal: true).order(order: :asc)
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
        @consult = @user.consults.create(name: params[:name], contact: params[:contact], content: params[:content])
        if @consult.errors.messages.size != 0
          error!({code: 102, error:  @consult.errors.messages.values.flatten.first})
        end
      end

      desc 'get consults'
      get '/consults' do 
        @consults = @user.consults.order(created_at: :desc)
        consults = present @consults, with: API::Entities::Consult
        build_response code: 0, data: consults
      end

      desc 'create appointment'
      post '/appointment' do
        @appointment = @user.appointments.create(name: params[:name], contact: params[:contact], date: params[:date], time: params[:time])
        if @appointment.errors.messages.size != 0
          error!({code: 102, error:  @appointment.errors.messages.values.flatten.first})
        end
      end

      desc 'get appointments'
      get '/appointments' do
        @appointments = @user.appointments.order(created_at: :desc)
        appointments = present @appointments, with: API::Entities::Appointment
        build_response code: 0, data: appointments
      end
    end
  end
end
