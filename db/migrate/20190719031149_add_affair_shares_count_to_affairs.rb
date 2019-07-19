class AddAffairSharesCountToAffairs < ActiveRecord::Migration[5.2]
  def change
    add_column :affairs, :affair_shares_count, :integer, default: 0
  end
end
