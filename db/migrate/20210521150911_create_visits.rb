class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.belongs_to :doctor, foreign_key: true
      t.datetime 'data_ora'
      t.string 'tipo_visita'
      t.string 'stato_visita'
      t.belongs_to :user, foreign_key: true
      t.belongs_to :kid, foreign_key: true
      t.timestamps
    end
  end
end
