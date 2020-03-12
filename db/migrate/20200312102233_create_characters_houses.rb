class CreateCharactersHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_houses do |t|
      t.references :character, null: false, foreign_key: true
      t.references :house, null: false, foreign_key: true
    end
  end
end
