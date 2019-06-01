class CreateCarousels < ActiveRecord::Migration[5.2]
  def change
    create_table :carousels do |t|
      t.string :name
      t.string :pic
      t.integer :order, default: 0
      t.integer :user_id
      t.boolean :reveal

      t.timestamps
    end
    add_index :carousels, :user_id
  end
end
