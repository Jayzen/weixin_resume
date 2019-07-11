module API
  module V1
    class MallTwo < Grape::API
      include Default
      include Grape::Rails::Cache

      before do
        validate_appkey
      end

      desc 'find banner'
      get '/banners/first' do
        @banner = @user.banners.first
        @banner_items = @banner.banner_items
        banner_items = present @banner_items, with: API::Entities::BannerItem
        build_response code: 0, data: banner_items
      end

      desc 'find themes'
      get '/themes' do
        @themes = @user.themes.where(reveal: true).order(order: :asc)
        themes = present @themes, with: API::Entities::Theme
        build_response code: 0, data: themes
      end

      desc 'find specific theme'
      get '/themes/:id' do
        @theme = @user.themes.includes(:products).where(reveal: true).find(params[:id])
        theme = present @theme, with: API::Entities::ThemeDetail
        build_response code: 0, data: theme
      end
    end
  end
end
