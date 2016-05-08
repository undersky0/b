# y=β0+β1x

# linear regression equation: r̂ (x)=β̂ 0+β̂ 1x
# error between models and data calculated using residual sums of squares: ∑i=0nε̂ 2i=∑i=0n(yi−(β̂ 0+β̂ 1xi))2

# β̂ 0=Y¯−β̂ X¯
# β^0=Y¯−β^X¯
# β̂ 1=∑ni=1(Xi−X¯)(Yi−Y¯)∑ni=1(Xi−X¯)2
class LinearRegression

	def initialize(a,b)
		@a,@b = a,b
    if a.length > b.length
      @a = @a.first(b.length)
    else
      @b = @b.first(a.length)
    end
	end

  def y_intercept
    mean(@b) - (slope * mean(@a))
  end

	def mean(values)
		total = values.reduce(0) { |sum, x| x + sum }
		total.to_f / values.length.to_f
	end

#pass in 2x array of vals
	def numerator
		a_mean = mean(@a)
		b_mean = mean(@b)
		numerator = (0...@a.length).reduce(0) do |sum,i|
			sum + ((@a[i] - a_mean) * (@b[i] - b_mean))
		end
	end

	def denominator
		denominator = @a.reduce(0) do |sum,x|
			sum + ((x-mean(@a)) ** 2)
		end
	end

	def slope
		(numerator/denominator)
	end

end