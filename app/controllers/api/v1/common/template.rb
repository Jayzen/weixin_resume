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
        post '/consult_template' do
          validate_appkey
          @user.send_consult_template(params[:form_id], params[:name], params[:contact])
        end

        desc 'get appointment template'
        params do
          requires :form_id, type: String
          optional :name, type: String
          optional :contact, type: String
          optional :date, type: String
        end
        post '/appointment_template' do
          validate_appkey
          @user.send_appointment_template(params[:form_id], params[:name], params[:contact], params[:date])
        end
      end
    end
  end
end
