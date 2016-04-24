class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.integer :match_id
      t.string :player_1
      t.string :player_2
      t.integer :player_1_id
      t.integer :player_2_id
      t.string :tournament
      t.string :round
      t.string :court
      t.string :time
      t.string :surface
      t.string :umpire
      t.integer :best_of
      t.integer :final_tb

      t.timestamps null: false
    end
  end
end