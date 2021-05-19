#Per nuove migrazioni fare da terminale (<rails g migration Nome) poi entrare nel file creatosi in db/migrate e aggiungere contenuto come sotto ; poi rake db:migrate da shell
class Telefonostring < ActiveRecord::Migration[6.1]
  def change
    remove_column :users,:telefono
    add_column :users,:telefono,:string
  end
end
