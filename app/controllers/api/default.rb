module API
  module Default
    extend ActiveSupport::Concern

    included do
      include Helpers::Common
      
      version 'v1', using: :path

      content_type :json, 'application/json'
      content_type :txt, 'text/plain'

      default_format :json

      rescue_from ActiveRecord::RecordNotFound do |e|
        error!({code: 102, error: e }, 404)
      end

      rescue_from NoMethodError do |e|
        error!({code: 1, error: 'system error'}, 422)
      end
    end
  end
end
