class AddFields < ActiveRecord::Migration[6.1]
  
    def change
      add_column :users, :nome, :string
      add_column :users, :cognome, :string
      add_column :users, :telefono, :string
    end
  
end
