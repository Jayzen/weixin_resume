class CreateBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :basics do |t|
      t.string :name
      t.string :avatar
      t.string :motto
      t.text :introduce
      t.string :phone
      t.string :wechat
      t.string :email
      t.string :company
      t.string :job
      t.string :position
      t.integer :visit, default: 0
      t.integer :user_id

      t.timestamps
    end
    add_index :basics, :user_id
  end
end
