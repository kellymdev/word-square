class CreateTurns < ActiveRecord::Migration
  def change
    create_table :turns do |t|
      t.string :guess
      t.belongs_to :game
      t.timestamps null: false
    end
  end
end
