class DropTableFormTapCarousels < ActiveRecord::Migration[5.2]
  def change
    drop_table :tap_sorts
  end
end
