class AddWordCountToGame < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :word_count, :integer
  end
end
