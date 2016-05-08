# fi = percentage of points won on serve for player i
# gi = percentage of points won on return for player i
# ai = first serve percentage of player i
# aav = average first serve percentage (across all players)
# bi = first serve win percentage of player i
# ci = second serve win percentage of player i
# di = first service return points win percentage of player i
# ei = second service return points win percentage of player i


class Predictor

  def initialize(p1, p2)
    @p1 = Player.find_by_id p1
    @p2 = Player.find_by_id p2
    @p1_all_overviews = Overview.where(match_id:@p1.overviews.pluck(:match_id)).joins(:player).where("player_id != ? AND players.lrank BETWEEN 1 AND 100", @p1.id)
    @p2_all_overviews = Overview.where(match_id:@p2.overviews.pluck(:match_id)).joins(:player).where("player_id != ? AND players.lrank BETWEEN 1 AND 100 ", @p1.id)
    @p1_relevant_overviews
    @fi = nil
  end

  def points_won_on_serve_1
    a = @p1_overview.where(set:1).pluck(:serve_pts)
    b = @p2_overview.where(set:1).pluck(:serve_pts)
    a,b
  end



end