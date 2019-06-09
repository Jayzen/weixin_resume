module API
  module V1
    class WeddingOne < Grape::API
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
        @tap_carousel = @user.tap_carousels.find(params[:id])
        @tap_carousel_photographs = @tap_carousel.tap_carousel_photographs
        tap_carousel_photographs = present @tap_carousel_photographs, with: API::Entities::TapCarouselPhotograph
        build_response code: 0, data: tap_carousel_photographs
      end
    end
  end
end
