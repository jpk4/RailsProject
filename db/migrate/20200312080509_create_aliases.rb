class CreateAliases < ActiveRecord::Migration[6.0]
  def change
    create_table :aliases do |t|
      t.string :name
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
