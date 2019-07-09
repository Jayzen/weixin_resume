class CreateSorts < ActiveRecord::Migration[5.2]
  def change
    create_table :sorts do |t|
      t.string :name
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :user_id

      t.timestamps
    end
    add_index :sorts, :user_id
    
    drop_table :product_sorts
  end
end
