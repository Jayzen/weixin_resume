module API
  module V1
    module Common
      class Template < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'get consult template'
        params do
          requires :form_id, type: String
          optional :name, type: String
          optional :contact, type: String 
        end
        post '/template/achieve' do
          validate_appkey
          openid_message = @user.send_template(params[:form_id], params[:name], params[:contact])
        end

        desc 'get appointment template'
        params do
          requires :form_id, type: String
        end
        post '/appointment_template' do
          validate_appkey
          @user.send_appointment_template(params[:form_id])
        end
      end
    end
  end
end
