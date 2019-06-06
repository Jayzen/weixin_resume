module API
  module V1
    module Common
      class State < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find carousels'
        get '/states' do
          validate_appkey
          @states = @user.states
          states = present @states, with: API::Entities::State
          build_response code: 0, data: states
        end 
      end
    end
  end
end
