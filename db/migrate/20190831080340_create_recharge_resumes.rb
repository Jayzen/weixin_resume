class CreateRechargeResumes < ActiveRecord::Migration[5.2]
  def change
    create_table :recharge_resumes do |t|
      t.integer :guest_id
      t.decimal :recharge, precision: 5, scale: 2
      t.integer :from

      t.timestamps
    end
    add_index :recharge_resumes, :guest_id
  end
end
