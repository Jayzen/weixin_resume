class AddTapCarouselIdToTapPhotographs < ActiveRecord::Migration[5.2]
  def change
    add_column :tap_photographs, :tap_carousel_id, :integer
    add_index :tap_photographs, :tap_carousel_id
    remove_index :tap_photographs, :tap_sort_id
    remove_column :tap_photographs, :tap_sort_id
  end
end
