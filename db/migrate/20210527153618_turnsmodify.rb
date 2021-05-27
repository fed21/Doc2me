class Turnsmodify < ActiveRecord::Migration[6.1]
  def change
    remove_column :turns,:start
    remove_column :turns,:end 
    add_column :turns,:start,:integer
    add_column :turns,:end,:integer
    
  end
end
