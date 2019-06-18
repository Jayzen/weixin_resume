class RemoveSmallPicFromPhotographs < ActiveRecord::Migration[5.2]
  def change
    remove_column :photographs, :small_pic, :string
    remove_column :photographs, :big_pic, :string
    add_column :photographs, :pic, :string
  end
end
