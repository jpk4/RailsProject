class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :url_id
      t.string :name
      t.string :released
      t.integer :number_of_pages

      t.timestamps
    end
  end
end
