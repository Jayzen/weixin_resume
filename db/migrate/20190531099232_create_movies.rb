class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :content
      t.string :movie
      t.integer :order, default: 0
      t.boolean :reveal
      t.integer :user_id

      t.timestamps
    end
    add_index :movies, :user_id
  end
end
