class RemoveSetHomeFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :set_home, :boolean
  end
end
