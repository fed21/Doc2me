class Addcontactattributes < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :firstname, :string
    add_column :contacts, :lastname, :string
    add_column :contacts, :email, :string
    add_column :contacts, :tel, :string
  end
end
