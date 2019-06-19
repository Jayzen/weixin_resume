class AddAvatarToWeddingBasics < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_basics, :avatar, :string
  end
end
