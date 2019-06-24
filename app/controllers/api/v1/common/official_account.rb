module API
  module V1
    module Common
      class OfficialAccount < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'find official accounts'
        get '/official_accounts' do
          validate_appkey
          @official_accounts = @user.official_accounts.where(reveal: true).order(order: :desc)
          official_accounts = present @official_accounts, with: API::Entities::OfficialAccount
          build_response code: 0, data: official_accounts
        end
      end
    end
  end
end
