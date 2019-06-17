class AddContentToConsults < ActiveRecord::Migration[5.2]
  def change
    add_column :consults, :content, :text
  end
end
