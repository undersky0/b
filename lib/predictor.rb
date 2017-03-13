# fi = percentage of points won on serve for player i
# gi = percentage of points won on return for player i
# ai = first serve percentage of player i
# aav = average first serve percentage (across all players)
# bi = first serve win percentage of player i
# ci = second serve win percentage of player i
# di = first service return points win percentage of player i
# ei = second service return points win percentage of player i
# wrp = Avenerage winning on return percentage of player i
# as = percentage of matches won by player on  a surface a
# bs = percentrage of matches won by a player on a surface b



#get recent matches
#where game surface is the same
#againts players of similar calibre



#the match outcome depends on the difference between the serve-winning probabilities of the two players

#how to quantify players style ?

#DESCRIBE MATCH RELEVANCE


#FEATURE SELECTION: 

#DATA SELECTION: check: forward selection and backward elimitaiton  select{|m| m>20 && m<200}



# #In general, a player’s performance
# improves as they gather strength and experience in the first part of their career and later declines due
# to the physiological effects of ageing


class Predictor
  #get relevant overviews of similar calibre players
  def initialize(player1, player2)
    @p1 = Player.find_by_id played1
    @player2 = Player.find_by_id player2
    @played1_all_overviews = Overview.where(match_id:@played1.overviews.pluck(:match_id)).joins(:player)
    .where("player_id != ? AND players.lrank BETWEEN 1 AND 100 AND date > #{1.year.ago}", @played1.id)
    @player2_all_overviews = Overview.where(match_id:@player2.overviews.pluck(:match_id)).joins(:player)
    .where("player_id != ? AND players.lrank BETWEEN 1 AND 100 AND data > #{1.year.ago}", @played1.id)
    @fi = nil
  end

  def points_won_on_serve_1
    a = @played1_all_overview.where(set:1).pluck(:serve_pts)
    b = @player2_all_overview.where(set:1).pluck(:serve_pts)
    a,b
  end

  def points_won_on_serve_2
    a = @played1_all_overview.where(set:2).pluck(:serve_pts)
    b = @player2_all_overview.where(set:2).pluck(:serve_pts)
    a,b
  end



end