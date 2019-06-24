class AddTapCarouselIdToTapSorts < ActiveRecord::Migration[5.2]
  def change
    add_column :tap_sorts, :tap_carousel_id, :integer
    add_index :tap_sorts, :tap_carousel_id
  end
end
