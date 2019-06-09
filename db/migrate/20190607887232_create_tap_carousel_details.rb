class CreateTapCarouselDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :tap_carousel_details do |t|
      t.string :title
      t.string :pic
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :tap_carousel_photograph_id
      t.integer :user_id

      t.timestamps
    end
    add_index :tap_carousel_details, :user_id
    add_index :tap_carousel_details, :tap_carousel_photograph_id
  end
end
