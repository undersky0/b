class Player < ApplicationRecord

	has_many :overviews, :foreign_key => :player_id

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
end
 