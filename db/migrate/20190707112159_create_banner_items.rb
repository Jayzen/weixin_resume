class CreateBannerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :banner_items do |t|
      t.string :name
      t.string :pic
      t.integer :user_id
      t.integer :banner_id
      t.integer :order, default: 0
      t.boolean :reveal
 
      t.timestamps
    end

    add_index :banner_items, :user_id
    add_index :banner_items, :banner_id
  end
end
