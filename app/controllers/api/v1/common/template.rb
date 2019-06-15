module API
  module V1
    module Common
      class Template < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'get template'
        params do
          requires :form_id, type: String
        end
        post '/template/achieve' do
          validate_appkey
          openid_message = @user.send_template(params[:form_id])
        end
      end
    end
  end
end
