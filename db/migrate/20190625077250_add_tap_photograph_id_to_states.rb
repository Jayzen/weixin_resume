class AddTapPhotographIdToStates < ActiveRecord::Migration[5.2]
  def change
    add_column :states, :tap_photograph_id, :integer
    add_index :states, :tap_photograph_id
  end
end
