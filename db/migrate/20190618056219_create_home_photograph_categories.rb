class CreateHomePhotographCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :home_photograph_categories do |t|
      t.string :name
      t.string :pic
      t.integer :photograph_id
      t.integer :user_id
      t.integer :order, default: 0
      t.boolean :reveal

      t.timestamps
    end

    add_index :home_photograph_categories, :user_id
    add_index :home_photograph_categories, :photograph_id
  end
end
