class ChangeColumnFromAffairComments < ActiveRecord::Migration[5.2]
  def change
    change_column :affair_comments, :reveal, :boolean, default: true
  end
end
