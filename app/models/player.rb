class Player < ActiveRecord::Base

	has_many :overviews,  primary_key: :id, foreign_key: :player_id
	has_one :rank, primary_key: :pid, foreign_key: :pid

	# create polymorphic table later... 
	has_many :points1, foreign_key: :player_1_id, class_name: "Point"
	has_many :points2, foreign_key: :player_2_id, class_name: "Point"

	require 'Prime'
	require 'Matrix'

	def get_primes(i)
		return false unless i.is_a? Integer 
		a = []
		Prime.each(i) do |x|
			a << x
		end
		print_matrix a
	end

	def print_matrix a
		pp Matrix.row_vector(a).to_a.flatten
		Matrix.row_vector(a).each {|x|
			pp (x * Matrix.row_vector(a)).to_a.flatten.unshift(x)
		}
		return true
	end

	def all_points
		Point.where("player_1_id = ? OR player_2_id = ?", id, id)
	end



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


	def Percentage_of_points_won_on_serve_by_player

	end

end