class DropTableTapCarouselPhotographs < ActiveRecord::Migration[5.2]
  def change
    drop_table :tap_carousel_photographs
    drop_table :tap_carousel_details
  end
end
