class CreateMerchantBasicImages < ActiveRecord::Migration[5.2]
  def change
    create_table :merchant_basic_images do |t|
      t.string :name
      t.string :pic
      t.integer :user_id
      t.integer :merchant_basic_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :merchant_basic_images, :user_id
    add_index :merchant_basic_images, :merchant_basic_id
  end
end
