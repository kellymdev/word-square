class AddLettersToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :letters, :string
  end
end
