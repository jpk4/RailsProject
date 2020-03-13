# frozen_string_literal: true

class ChangeBornToBeStringInCharacters < ActiveRecord::Migration[6.0]
  def up
    change_column :characters, :born, :string
    change_column :characters, :died, :string
  end

  def down
    change_column :characters, :born, :datetime
    change_column :characters, :died, :datetime
  end
end
