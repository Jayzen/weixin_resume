class CreateMerchantBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :merchant_basics do |t|
      t.string :duty
      t.boolean :is_wifi
      t.boolean :is_parking
      t.boolean :is_wechat_pay
      t.boolean :is_alipay
      t.integer :user_id

      t.timestamps
    end
    add_index :merchant_basics, :user_id
  end
end
