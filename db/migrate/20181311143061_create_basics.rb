class CreateBasics < ActiveRecord::Migration[5.2]
  def change
    create_table :basics do |t|
      t.string :name
      t.boolean :is_name, default: true

      t.string :avatar
      t.boolean :is_avatar, default: true

      t.string :motto
      t.boolean :is_motto, default: true

      t.text :introduction
      t.boolean :is_introduction, default: true

      t.string :phone
      t.boolean :is_phone, default: true

      t.string :wechat
      t.boolean :is_wechat, default: true

      t.string :qq
      t.boolean :is_qq, default: true

      t.string :email
      t.boolean :is_email, default: true

      t.string :company
      t.boolean :is_company, default: true

      t.string :job
      t.boolean :is_job, default: true

      t.string :address
      t.boolean :is_address, default: true

      t.integer :visit, default: 0
      t.integer :user_id

      t.timestamps
    end
    add_index :basics, :user_id
  end
end
