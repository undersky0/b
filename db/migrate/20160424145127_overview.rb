class Overview < ActiveRecord::Migration
  def change
	create_table :overviews do |t|
      t.date :date
      t.integer :match_id
      t.integer :player
      t.integer :player_id
      t.string :set
      t.integer :serve_pts
      t.integer :aces
      t.integer :dfs
      t.integer :first_in
      t.integer :first_won
      t.integer :second_in
      t.integer :second_won
      t.integer :bk_pts
      t.integer :bp_saved
      t.integer :return_pts
      t.integer :return_pts_won
      t.integer :winners
      t.integer :winners_fh
      t.integer :winners_bh
      t.integer :unforced
      t.integer :unforced_fh
      t.integer :unforced_bh
      t.timestamps
    end
  end
end
