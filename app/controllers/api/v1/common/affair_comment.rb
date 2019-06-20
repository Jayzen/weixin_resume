module API
  module V1
    module Common
      class AffairComment < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'create affair comment'
        params do
          requires :token, type: String
          requires :content, type: String
          requires :affair_id, type: Integer
        end 
        post '/affair_comment' do
          if token = Rails.cache.fetch(params[:token])
            guest_id = JSON.parse(token)["guest_id"]
            @affair_comment = ::AffairComment.create(guest_id: guest_id, affair_id: params[:affair_id], content: params[:content])
            if @affair_comment.errors.messages.size != 0
              error!({code: 102, error:  @affair_comment.errors.messages.values.flatten.first})
            end
          end 
        end
      end
    end
  end
end
