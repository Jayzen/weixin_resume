class AddViewToAffairs < ActiveRecord::Migration[5.2]
  def change
    add_column :affairs, :view, :integer, default: 0
  end
end
