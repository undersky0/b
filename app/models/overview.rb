class Overview < ActiveRecord::Base

  #belongs_to :player
  attr_accessor :player_scores

  belongs_to :player

  def self.serve_pts_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:serve_pts)
  end

  def self.first_in_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:first_in)
  end

  def self.first_own_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:first_won)
  end

  def self.second_in_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:second_in)
  end

  def self.second_won_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:second_won)
  end

  def self.bk_pts_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:bk_pts)
  end

  def self.bp_saved_a(player_id, date = 1.year.ago)
    player_scores(player_id, date).map(&:bp_saved)
  end

  def self.player_scores(player_id, date = 1.year.ago)
    @player_scores = where("player_id = ? AND date > ?", player_id, date.to_date.to_s)
  end


# labels = [1, -1, 1, 1,0,-1]
# examples = [
#   [1, 0, 0, 1, 0],
#   [0, 0, 0, 1, 1]
# ]
# bias = 0.5 
# parameter = { solver_type: Liblinear::L2R_LR }
# model = Liblinear.train(parameter, labels, examples, bias)

end
