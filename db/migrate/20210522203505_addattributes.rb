class Addattributes < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :firstname, :string
    add_column :forms, :email, :string
    add_column :forms, :text, :string
  end
end
