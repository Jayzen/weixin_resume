module API
  module V1
    class WeddingTwo < Grape::API
      include Default
      include Grape::Rails::Cache

      before do
        validate_appkey
      end

      desc 'find carousels'
      get '/tap_carousels' do
        @carousels = @user.tap_carousels
        carousels = present @carousels, with: API::Entities::TapCarousel
        build_response code: 0, data: carousels
      end

      desc 'find home photographs'
      get '/home_photographs' do
        @home_photographs = @user.home_photographs
        home_photographs = present @home_photographs, with: API::Entities::HomePhotograph
        build_response code: 0, data: home_photographs
      end

      desc 'find tap photograph'
      get '/home_photographs/:id' do
        @home_photograph = @user.home_photographs.includes(:tap_photograph).find(params[:id])
        @tap_photograph = @home_photograph.tap_photograph
        tap_photograph = present @tap_photograph, with: API::Entities::TapPhotograph
        build_response code: 0, data: tap_photograph
      end

      desc 'find tap photograph'
      get '/states/:id' do
        @state = @user.states.includes(:tap_photograph).find(params[:id])
        @tap_photograph = @state.tap_photograph
        tap_photograph = present @tap_photograph, with: API::Entities::TapPhotograph
        build_response code: 0, data: tap_photograph
      end      
 
      desc 'find tap carousel'
      get '/tap_carousels/:id' do
        @tap_carousel = @user.tap_carousels.includes(:tap_photographs).find(params[:id])
        @tap_photographs = @tap_carousel.tap_photographs
        tap_photographs = present @tap_photographs, with: API::Entities::TapPhotograph
        build_response code: 0, data: tap_photographs
      end

      desc 'find tap photograph'
      get '/tap_photographs/:id' do
        @tap_photograph = @user.tap_photographs.includes(:tap_photograph_images).find(params[:id])
        @tap_photograph_images = @tap_photograph.tap_photograph_images
        tap_photograph_images = present @tap_photograph_images, with: API::Entities::TapPhotographImage
        build_response code: 0, data: tap_photograph_images
      end
      
      desc 'create contact'
      post '/contact' do
        @contact = @user.contacts.create(name: params[:name], telephone: params[:telephone])
        if @contact.errors.messages.size != 0
          error!({code: 102, error:  @contact.errors.messages.values.flatten.first})
        end
      end

      desc 'get contacts'
      get '/contacts' do
        @contacts = @user.contacts.order(created_at: :desc)
        contacts = present @contacts, with: API::Entities::Contact
        build_response code: 0, data: contacts
      end
    end
  end
end
