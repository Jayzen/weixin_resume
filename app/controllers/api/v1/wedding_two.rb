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

      desc 'find tap carousel'
      get '/tap_carousels/:id' do
        @tap_carousel = @user.tap_carousels.includes(:tap_sorts).find(params[:id])
        @tap_sorts = @tap_carousel.tap_sorts
        tap_sorts = present @tap_sorts, with: API::Entities::TapSort
        build_response code: 0, data: tap_sorts
      end

      desc 'find tap photograph'
      get '/tap_sorts/:id' do
        @tap_sort = @user.tap_sorts.includes([tap_photograph: :tap_photograph_images]).find(params[:id])
        @tap_photograph = @tap_sort.tap_photograph
        tap_photograph = present @tap_photograph, with: API::Entities::TapPhotograph
        build_response code: 0, data: tap_photograph 
      end

    end
  end
end
