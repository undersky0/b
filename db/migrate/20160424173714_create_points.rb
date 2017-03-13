class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.date :date
      t.integer :player_1_id, references: :player
      t.integer :player_2_id, references: :player
      t.integer :pt
      t.integer :set1
      t.integer :set2
      t.integer :gm1
      t.integer :gm2
      t.string :pts
      t.integer :gm
      t.integer :tbset
      t.integer :tb
      t.integer :tbpt
      t.integer :svr
      t.integer :ret
      t.string :first
      t.string :second
      t.integer :serving
      t.text :notes
      t.string :first_no_let
      t.string :first_in
      t.string :second_in
      t.string :second_no_let
      t.string :second_sv
      t.string :first_sv
      t.string :first_no_sv
      t.string :second_no_sv
      t.string :is_rally_first
      t.string :is_rally_second
      t.string :sv_first
      t.string :sv_second
      t.string :rally
      t.string :is_ace
      t.string :is_Unret
      t.string :is_rally_winner
      t.string :is_forced
      t.string :is_unforced
      t.string :is_double
      t.string :rally_no_spec
      t.string :rally_no_error
      t.string :rally_no_direction
      t.string :rally_len
      t.string :pt_winner
      t.string :is_svr_winner
      t.string :pts_after
      t.integer :gm_w
      t.integer :gm_1
      t.integer :gm_2
      t.integer :set_w
      t.integer :set1a
      t.integer :set2a
      t.integer :rev_tb
      t.integer :tb_rev
      t.integer :rally_count
      t.timestamps null: false
    end
  end
end

