class RemoveSortIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :sort_id, :integer
  end
end
