class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :guest_id
      t.integer :user_id
      t.text :content
      t.boolean :show, default: false

      t.timestamps
    end
    add_index :comments, :guest_id
  end
end
