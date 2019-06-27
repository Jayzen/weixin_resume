class AddProductIdToAffairs < ActiveRecord::Migration[5.2]
  def change
    add_column :affairs, :product_id, :integer
    add_index :affairs, :product_id
  end
end
