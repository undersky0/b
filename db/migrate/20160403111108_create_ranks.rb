class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.date :ranking_date
      t.integer :ranking
      t.integer :pid
      t.integer :ranking_points

      t.timestamps
    end
  end
end
