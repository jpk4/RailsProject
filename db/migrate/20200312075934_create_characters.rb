class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :url_id
      t.string :name
      t.datetime :born
      t.datetime :died
      t.string :culture
      t.string :quote
      t.integer :kill_count

      t.timestamps
    end
  end
end
