class CreateTurns < ActiveRecord::Migration[6.1]
  def change
    create_table :turns do |t|
      t.belongs_to :doctor, foreign_key: true
      t.datetime 'start'
      t.datetime 'end'
      t.integer 'day'
      t.timestamps
    end
  end
end
