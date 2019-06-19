class CreateAffairs < ActiveRecord::Migration[5.2]
  def change
    create_table :affairs do |t|
      t.string :name
      t.integer :user_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :affairs, :user_id
  end
end
