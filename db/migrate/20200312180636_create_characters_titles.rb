class CreateCharactersTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_titles do |t|
      t.references :character, null: false, foreign_key: true
      t.references :title, null: false, foreign_key: true
    end
  end
end
