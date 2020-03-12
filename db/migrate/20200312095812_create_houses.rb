class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :url_id
      t.string :name
      t.string :region
      t.string :coat_of_arms
      t.string :words

      t.timestamps
    end
  end
end
