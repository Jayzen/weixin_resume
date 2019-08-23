class RemoveNameFromProductGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :product_groups, :name, :string
  end
end
