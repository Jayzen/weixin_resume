class AddContentToAffairs < ActiveRecord::Migration[5.2]
  def change
    add_column :affairs, :content, :text
    remove_column :affairs, :name, :string
  end
end
