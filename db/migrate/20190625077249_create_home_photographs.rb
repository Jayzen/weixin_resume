class CreateHomePhotographs < ActiveRecord::Migration[5.2]
  def change
    create_table :home_photographs do |t|
      t.string :name
      t.string :pic
      t.integer :user_id
      t.integer :tap_photograph_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :home_photographs, :user_id
    add_index :home_photographs, :tap_photograph_id
  end
end
