module Api::V1
	class PlayersController < ApiController


		def index 
			render json: Player.all
		end

	end 
end
