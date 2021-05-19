class AddFieldstodoctors < ActiveRecord::Migration[6.1]
  
    def change
      add_column :doctors,:nome,:string
      add_column :doctors,:cognome,:string
      add_column :doctors,:telefono,:integer
     end
  
end
