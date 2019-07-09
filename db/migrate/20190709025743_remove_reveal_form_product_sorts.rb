class RemoveRevealFormProductSorts < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_sorts, :reveal
  end
end
