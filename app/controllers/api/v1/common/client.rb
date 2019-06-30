module API
  module V1
    module Common
      class Client < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'create client'
        post '/client' do
          debugger
          @client = ::Client.create(name: params[:name], contact: params[:contact])
          if @client.errors.messages.size != 0
            error!({code: 102, error:  @client.errors.messages.values.flatten.first})
          end
        end
      end
    end
  end
end
