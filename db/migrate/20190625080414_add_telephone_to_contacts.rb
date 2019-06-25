class AddTelephoneToContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :contact
    add_column :contacts, :telephone, :string
  end
end
