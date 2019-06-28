class AddSetHomeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :set_home, :boolean
  end
end
