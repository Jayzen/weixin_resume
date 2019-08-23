class AddRemarkToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :remark, :integer, default: 0
  end
end
