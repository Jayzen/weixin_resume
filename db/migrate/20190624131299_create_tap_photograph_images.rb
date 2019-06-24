class CreateTapPhotographImages < ActiveRecord::Migration[5.2]
  def change
    create_table :tap_photograph_images do |t|
      t.string :name
      t.string :pic
      t.integer :user_id
      t.integer :tap_photograph_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :tap_photograph_images, :user_id
    add_index :tap_photograph_images, :tap_photograph_id
  end
end
