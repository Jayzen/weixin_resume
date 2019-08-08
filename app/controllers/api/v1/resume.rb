module API
  module V1
    class Resume < Grape::API
      include Default
      include Grape::Rails::Cache

      desc 'create comment'
      params do
        requires :token, type: String
        requires :content, type: String
      end
      post '/comment' do
        if token = Redis.new.get(params[:token])
          guest_id = JSON.parse(token)["guest_id"]
          validate_appkey
          @comment = Comment.create(guest_id: guest_id, user_id: @user.id, content: params[:content])
          if @comment.errors.messages.size != 0
            error!({code: 102, error:  @comment.errors.messages.values.flatten.first})
          end
        end
      end

      desc 'get all comments'
      get '/comments' do
        validate_appkey
        @comments = @user.comments.includes(:guest)
        comments = present @comments, with: API::Entities::Comment
        build_response code: 0, data: comments
      end
    end
  end
end
