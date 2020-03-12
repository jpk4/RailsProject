class CreateHousesTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :houses_titles do |t|
      t.references :house, null: false, foreign_key: true
      t.references :title, null: false, foreign_key: true
    end
  end
end
