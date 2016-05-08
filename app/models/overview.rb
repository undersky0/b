class Overview < ActiveRecord::Base

  #belongs_to :player
  #attr_accessor :player_id

  belongs_to :player

  def self.serve_pts_a(date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:serve_pts)
  end

  def self.first_in_a(player_id, date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:first_in)
  end

  def self.first_own_a(player_id, date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:first_won)
  end

  def self.second_in_a(player_id, date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:second_in)
  end

  def self.second_won_a(player_id, date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:second_won)
  end

  def self.bk_pts_a(player_id, date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:bk_pts)
  end

  def self.bp_saved_a(player_id, date = 1.year.ago)
    where("player_id = ? AND date > ?", player_id, date.to_date.to_s).to_a.map(&:bp_saved)
  end




end
