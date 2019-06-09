class CreateTapCarouselPhotographs < ActiveRecord::Migration[5.2]
  def change
    create_table :tap_carousel_photographs do |t|
      t.string :name
      t.string :home_pic
      t.string :category_pic
      t.integer :order, default: 0
      t.integer :user_id
      t.integer :tap_carousel_id
      t.boolean :reveal

      t.timestamps
    end
    add_index :tap_carousel_photographs, :user_id
    add_index :tap_carousel_photographs, :tap_carousel_id
  end
end
