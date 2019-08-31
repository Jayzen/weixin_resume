class ChangeFromRechargeResumes < ActiveRecord::Migration[5.2]
  def change
    change_column :recharge_resumes, :from, :integer, default: 0
  end
end
