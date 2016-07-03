class AddTargetLetterToGame < ActiveRecord::Migration
  def change
    add_column :games, :target_letter, :string
  end
end
