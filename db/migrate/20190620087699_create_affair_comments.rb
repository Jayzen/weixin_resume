class CreateAffairComments < ActiveRecord::Migration[5.2]
  def change
    create_table :affair_comments do |t|
      t.text :content
      t.integer :guest_id
      t.integer :affair_id
      t.boolean :reveal

      t.timestamps
    end

    add_index :affair_comments, :guest_id
    add_index :affair_comments, :affair_id
  end
end
