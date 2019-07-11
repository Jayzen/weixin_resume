class AddPicToSorts < ActiveRecord::Migration[5.2]
  def change
    add_column :sorts, :pic, :string
  end
end
