class Telefonomedico < ActiveRecord::Migration[6.1]
  def change
      remove_column :doctors,:telefono
      add_column :doctors,:telefono,:string
  end
end
