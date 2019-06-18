class CreateRecents < ActiveRecord::Migration[5.2]
  def change
    create_table :recents do |t|
      t.string :name
      t.string :pic
      t.integer :photograph_id
      t.integer :user_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :recents, :user_id
    add_index :recents, :photograph_id
  end
end
