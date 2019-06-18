module API
  module V1
    module Common
      class HomePhotographCategory < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find carousels'
        get '/home_photograph_categories' do
          validate_appkey
          @home_photograph_categories = @user.home_photograph_categories.includes(:photograph).where(reveal: true).order(order: :asc)
          home_photograph_categories = present @home_photograph_categories, with: API::Entities::HomePhotographCategory
          build_response code: 0, data: home_photograph_categories
        end 
      end
    end
  end
end
