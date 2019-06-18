class AddPhotographIdToCarousels < ActiveRecord::Migration[5.2]
  def change
    add_column :carousels, :photograph_id, :integer
    add_index :carousels, :photograph_id
  end
end
