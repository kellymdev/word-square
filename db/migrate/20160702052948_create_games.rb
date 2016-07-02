class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :word
      t.timestamps null: false
    end
  end
end
