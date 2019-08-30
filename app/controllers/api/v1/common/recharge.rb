module API
  module V1
    module Common
      class Recharge < Grape::API
        include Default
        include Grape::Rails::Cache

        desc 'get all recharge cards'
        get 'recharge_cards' do
          validate_appkey
          @recharge_cards = @user.recharge_cards.where(reveal: true).order(order: :desc)
          recharge_cards = present @recharge_cards, with: API::Entities::RechargeCard
        end
      
        desc 'get all recharge records'
        get 'recharge_records' do
          if token = Rails.cache.fetch(request.headers["Token"])
            validate_appkey
            guest_id = JSON.parse(token)["guest_id"]
            @guest = @user.guests.find(guest_id)
            @recharge_records = @guest.recharge_records.order(created_at: :desc)
            recharge_records = present @recharge_records, with: API::Entities::RechargeRecord
          else
            error!({code: 102, error: "不存在token"})
          end
        end 

        desc 'update guest recharge'
        params do
          requires :recharge, type: Float
        end
        put 'guest/recharge' do
          validate_appkey
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @guest = @user.guests.find(guest_id)
            @guest.recharge = @guest.recharge + params[:recharge]
            @guest.save
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'create recharge record'
        params do
          requires :recharge, type: Float
          optional :benefit, type: Float
          optional :from, type: Integer
        end
        post 'recharge_record' do
          validate_appkey
          if token = Rails.cache.fetch(request.headers["Token"])
            guest_id = JSON.parse(token)["guest_id"]
            @guest = @user.guests.find(guest_id)
            @recharge_record = @guest.recharge_records.create(recharge: params[:recharge], benefit: params[:benefit], from: params[:from])
            if @recharge_record.errors.messages.size != 0
              error!({code: 102, error:  @recharge_record.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end

        desc 'update recharge password'
        params do 
          requires :password, type: String
        end
        put 'recharge_password' do
          if token = Rails.cache.fetch(request.headers["Token"])
            validate_appkey
            guest_id = JSON.parse(token)["guest_id"]
            @guest = @user.guests.find(guest_id)
            @guest.update(password: params[:password])
            if @guest.errors.messages.size != 0
              error!({code: 102, error:  @guest.errors.messages.values.flatten.first})
            end
          else
            error!({code: 102, error: "不存在token"})
          end
        end
      end
    end
  end
end
