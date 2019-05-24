module API
  module V1
    module Common
      class Client < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'create client'
        params do 
          requires :name, type: String, allow_blank: false
          requires :contact, type: String, allow_blank: false
        end
        post '/client' do
          Client.create(name: params[:name], contact: params[:contact])
        end
      end
    end
  end
end
