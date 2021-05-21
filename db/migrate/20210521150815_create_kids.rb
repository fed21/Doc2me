class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string 'name'
      t.string 'surname'
      t.belongs_to :user, foreign_key: true
      t.string 'birth_place'
      t.date 'birth_date'
      t.string 'sesso'
      t.timestamps
    end
  end
end
