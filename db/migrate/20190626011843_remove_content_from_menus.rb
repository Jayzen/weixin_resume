class RemoveContentFromMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :menus, :content, :string
  end
end
