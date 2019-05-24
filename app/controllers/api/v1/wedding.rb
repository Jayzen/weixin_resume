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

      desc 'find categories'
      get '/categories' do
        validate_appkey
        @categories = @user.categories
        categories = present @categories, with: API::Entities::Category
        build_response code: 0, data: categories
      end

      desc 'find one category'
      get 'categories/:id' do
        validate_appkey
        @category = @user.categories.find(params[:id])
        category = present @category, with: API::Entities::Category
        build_response code: 0, data: category
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
        @appointment = @user.appointments.create(name: params[:name], contact: params[:contact], content: params[:content])
        if @appointment.errors.messages.size != 0
          error!({code: 102, error:  @appointment.errors.messages.values.flatten.first})
        end
      end
    end
  end
end
