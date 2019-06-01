module API
  module V1
    class Workshop < Grape::API
      include Default
      include Grape::Rails::Cache

      before do
        validate_appkey
      end

      desc 'find basic'
      get '/workshop_basic' do
        @workshop_basic = @user.workshop_basic
        workshop_basic = present @workshop_basic, with: API::Entities::WorkshopBasic
        build_response code: 0, data: workshop_basic
      end
    end
  end
end
