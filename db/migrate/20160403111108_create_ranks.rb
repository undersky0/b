class CreateRanks < ActiveRecord::Migration
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
