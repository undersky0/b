

class Betting

  def initialize
    #si = amount to stake on a player
    #pi_bettor = bettors estimate of probability of player i winning
    #bi = net odds received when betting on a player i, calucates as x/y for odds X/Y
    #pi_implied = implied probability of player i winning, y(y+x) for ods X/Y
  end

  def betting_on_predicted_winner
    #q = fixed amount
    @pi_bettor > @pi_implied ? q : nil
  end

  def steak_amount
    (@pi*(@bi+1) - 1)/@bi unless betting_on_predicted_winner.nil?
  end

end