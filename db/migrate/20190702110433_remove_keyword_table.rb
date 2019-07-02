class RemoveKeywordTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :keywords
  end
end
