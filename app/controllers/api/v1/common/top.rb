module API
  module V1
    module Common
      class Top < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find top'
        get '/top' do
          validate_appkey
          @top = @user.tops.where(reveal: true).order(weight: :desc).first
          top = present @top, with: API::Entities::Top
          build_response code: 0, data: top
        end 
      end
    end
  end
end
