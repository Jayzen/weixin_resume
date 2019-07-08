class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :home_pic
      t.string :theme_pic
      t.integer :order, default: 0
      t.integer :user_id
      t.boolean :reveal
 
      t.timestamps
    end

    add_index :themes, :user_id
  end
end
