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

      desc 'find tap_carousel photographs'
      get '/tap_carousels/:id' do
        @tap_carousel = @user.tap_carousels.includes(:tap_sorts).find(params[:id])
        @tap_sorts = @tap_carousel.tap_sorts
        tap_sorts = present @tap_sorts, with: API::Entities::TapSort
        build_response code: 0, data: tap_sorts
      end

      desc 'find home tap carousel photograph'
      get '/tap_carousel_photographs' do
        @tap_carousel_photographs = @user.tap_carousel_photographs
        tap_carousel_photographs = present @tap_carousel_photographs, with: API::Entities::TapCarouselPhotograph
        build_response code: 0, data: tap_carousel_photographs
      end
      
      desc 'find tap_carousel photograph detail'
      get '/tap_carousel_photographs/:id' do
        @tap_carousel_photograph = @user.tap_carousel_photographs.find(params[:id])
        @tap_carousel_details = @tap_carousel_photograph.tap_carousel_details
        tap_carousel_details = present @tap_carousel_details, with: API::Entities::TapCarouselDetail
        build_response code: 0, data: tap_carousel_details
      end
    end
  end
end
