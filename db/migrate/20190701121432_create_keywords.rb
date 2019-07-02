class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :name
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :user_id

      t.timestamps
    end
    add_index :keywords, :user_id
  end
end
