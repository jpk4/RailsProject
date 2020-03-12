class CreateBooksCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :books_characters do |t|
      t.references :book, null: false, foreign_key: true
      t.references :character, null: false, foreign_key: true
    end
  end
end
